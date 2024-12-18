To use SSH connection can make better in some cases, so we need to learn how to use that.

To use SSH connection, we need to have public and private keys, for that, we need to generate them.
This command can do it:
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
Here, we can replace the email part with ours.

Using this command, we can start ssh agent:
eval "$(ssh-agent -s)"

Then we need to add our private key to our agent using that command:
ssh-add ~/.ssh/id_rsa

We need to use our public key in github, so that we need to take it. The get public key, we use that command:
cat ~/.ssh/id_rsa.pub

In GitHub, we go to GitHub SSH and GPG keys settings.
Here we create new SSH key and paste our public key and give it any title.

We can test our connection using that command:
ssh -T git@github.com

The output will be something like that:
Hi username! You've successfully authenticated, but GitHub does not provide shell access.

If our connection was https beforehand and now want to change it to ssh, we can use this command for that:
git remote set-url origin git@github.com:username/repository.git

We can use the same ssh key for multiple repositories, but it is also possible to create multiple ssh keys for multiple repositories.