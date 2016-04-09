## Signing Your Work on Git

### Getting started

Let's start by installing the GNU Privacy Guard, which is a complete and free
implementation of the OpenPGP standard as defined by [RFC4880][1] (also known as
PGP).

On OS X, you can grab it using Homebrew:

    brew install gpg2

Furthermore, you can alias this binary as `gpg`.

If you're on another *NIX system, it's likely that you already have `gpg` or
`gnupg` already installed.

[1]: http://www.ietf.org/rfc/rfc4880.txt

From this point on, due to the different ways that systems refer to the binary,
I'm going to address it as `gpg`.

### Generating a public/private key pair

If you don't have an existing GPG key, you should generate one in order to sign
your work. Hence, your personal key must be installed.

```
➔ gpg --list-keys
/Users/ruipereira/.gnupg/pubring.gpg
------------------------------------
pub   2048R/6C1EEE05 2016-04-08
uid       [ultimate] Rui Afonso Pereira <ruiafonsopereira@gmail.com>
sub   2048R/8C44BD6A 2016-04-08
```

If you don’t have a key installed, you can generate one with `gpg --gen-key`.

### Adding identities

It would be tedious if we had to go through this whole process for every email
address we have. You can easily edit your key to add another user id:

    ➔ gpg --edit-key ruiafonsopereira@gmail.com

    Secret key is available.

    pub  2048R/6C1EEE05  created: 2016-04-08  expires: never       usage: SC
                     trust: ultimate      validity: ultimate
    sub  2048R/8C44BD6A  created: 2016-04-08  expires: never       usage: E
    [ultimate] (1)  Rui Afonso Pereira <ruiafonsopereira@gmail.com>

    gpg>

In this prompt, you can type `help` for more information. In order to add a new
user ID, type `adduid`.

    gpg> adduid
    Real name: Rui Afonso Pereira
    Email address: rui@deltaworx.eu
    Comment:
    You selected this USER-ID:
        "Rui Afonso Pereira <rui@deltaworx.eu>"

    Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o

    You need a passphrase to unlock the secret key for
    user: "Rui Afonso Pereira <ruiafonsopereira@gmail.com>"
    2048-bit RSA key, ID 6C1EEE05, created 2016-04-08


    pub  2048R/6C1EEE05  created: 2016-04-08  expires: never       usage: SC
                         trust: ultimate      validity: ultimate
    sub  2048R/8C44BD6A  created: 2016-04-08  expires: never       usage: E
    [ultimate] (1). Rui Afonso Pereira <rui@deltaworx.eu>
    [ultimate] (2)  Rui Afonso Pereira <ruiafonsopereira@gmail.com>

    gpg> save

The key now has two UIDs attached.

    ➔ gpg --list-keys 6C1EEE05
    pub   2048R/6C1EEE05 2016-04-08
    uid       [ultimate] Rui Afonso Pereira <rui@deltaworx.eu>
    uid       [ultimate] Rui Afonso Pereira <ruiafonsopereira@gmail.com>
    sub   2048R/8C44BD6A 2016-04-08

Before adding the key to your GitHub accound, paste the text below, substituting
in the GPG key ID you'd like to use. In this example, the GPG key ID is
`6C1EEE05`:

    ➔ gpg --armor --export 6C1EEE05
    # Prints the GPG key, in ASCII armor format

It's now time to [add the GPG key to your GitHub
account](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account).

### Why is it important to sign your work

A strict policy of signing all commits could prevent someone committing as you
(perhaps with `GIT_COMMITTER_NAME` and `GIT_COMMITTER_EMAIL`) from fully blaming
you for a change. You can verify signatures using `git log`:

    ➔ git log --show-signature
    commit e80c6f611429db4e437a377d7b1b76c167594dcd
    gpg: Signature made Sat Apr  9 11:19:58 2016 WEST using RSA key ID 6C1EEE05
    gpg: Good signature from "Rui Afonso Pereira <rui@deltaworx.eu>" [ultimate]
    gpg:                 aka "Rui Afonso Pereira <ruiafonsopereira@gmail.com>" [ultimate]
    Author: Rui Afonso Pereira <ruiafonsopereira@gmail.com>
    Date:   Sat Apr 9 11:19:40 2016 +0100

### Signing commits

We should now configure git to automatically gpgsign commits. This consists of
pointing git to your signing key ID, and then enabling automatic signing of
git commits.

    ➔ git config --global user.signingkey <YOUR-SIGNING-KEY-PUB-ID>
    ➔ git config --global commit.gpgsign true

Furthermore, since we are using the `gpg2` binary on OS X, we should also tell
this to Git:

    ➔ git config --global gpg.program gpg2

Finally, from now on every commit will be _automatically_ signed.

### Automatic commit signing on OS X

Well, I lied. Your commits won't be automatically signed. You still need to
insert your GPG key's passphrase every time you commit something. It sounds like
a lot of work to me. Thus, let's try to automate the process.

We should start by installing the following binaries:

    ➔ brew install gpg-agent pinentry-mac

Now nativate to your `GPGHOMEDIR`, which is `$HOME/.gnupg` by default, and add
the following to your `gpg.conf` file:

```conf
# Uncomment within config (or add this line)
use-agent

# This silences the "you need a passphrase" message once the passphrase handling
# is all set.
batch
```

While inside the same directory, let's configure our `gpg-agent.conf`:

```conf
# Enables GPG to find gpg-agent
use-standard-socket

# Connects gpg-agent to the OSX keychain via the brew-installed pinentry program
# from GPGtools. This is the OSX magic, allowing the gpg key's passphrase to be
# stored in the login keychain, enabling automatic key signing.
pinentry-program /usr/local/bin/pinentry-mac
```

Now, it's time for the real trick in this whole process. In order for GPG to
find the `gpg-agent`, the later must be running, and there must be an
environment variable pointing GPG to its socket. The following will either start
`gpg-agent` or set up the `GPG_AGENT_INFO` variable if it's already running. You
should add this script to your `.bash_profile` or `.zprofile` so that it starts
for every shell.

```bash
if [[ -f ~/.gnupg/.gpg-agent-info ]] && [[ -n "$(pgrep gpg-agent)" ]]; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
```

The high level diagram for the automatic signing is thus `git -> gpg ->
shell/env variable -> gpg-agent -> pinentry -> keychain`.

Finally, we are ready to roll.
