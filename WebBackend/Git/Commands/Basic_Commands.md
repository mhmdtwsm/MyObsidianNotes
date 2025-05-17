
# `init`

Initializing the project creates a **.git** directory which will contain all the version control information; the main directories included in the project remain untouched.

And the Command to do this is `git init`

```bash
git init
```

and the content of the `.git` directory is like this:
```bash
git-test master ❯ ll .git

Permissions Size User Date Modified Name
.rw-r--r--    92 mhmd 18 May 00:37  config
.rw-r--r--    73 mhmd 18 May 00:37  description
.rw-r--r--    23 mhmd 18 May 00:37  HEAD
drwxr-xr-x     - mhmd 18 May 00:37  hooks
drwxr-xr-x     - mhmd 18 May 00:37  info
drwxr-xr-x     - mhmd 18 May 00:37  objects
drwxr-xr-x     - mhmd 18 May 00:37  refs
```

# `add`

To add a file we just created and it wasn't on the repo before we use `git add` to disclaim that there is a new file add to the repo.

```bash
echo gggggggggggg > file
git add file
```


# `status`

To see the last changes on the repo we can use the command `git status`

```bash
git-test master* ❯ git status

On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   file
```

# **Master vs Main**

Historically, a new repository was always created with an initial branch called **master**. However, many projects have deprecated this name and replaced it with **main**.

*Reasons for this change and other changes of terminology, such as deprecation of the use of the words blacklist and whitelist, are [explained](https://inclusivenaming.org/language/word-list/ "explained") in a document created by the **Inclusive Naming Initiative**.*

Technically, this main branch could have any name, as there is nothing structurally special about this authoritative branch. However, git has to have a default name for new repositories, and some web hosts have requirements that are hard to avoid.

*GitHub has strongly recommended this naming convention change and has given [instructions](https://github.com/github/renaming) about how to create new repositories as well as rename old ones to have main as the main branch.*

**Let's now change the "master" branch name from "master" to "main"**

**First** let's make a commit, because in an **empty repo (no commits)**, Git doesn't truly create a branch. Instead, it just puts you into a sort of _"branch placeholder state."

When you then switch to a new branch (e.g., `main`), **the previous placeholder is lost**.

```bash
git commit -m 'First Commit'
```


To change the "root" branch  master -> main there are 2 ways:
1. Making new branch (`main`) and deleting the old one (`master`)
2. Renaming

**First approach:**

Make the new branch:

```bash
git checkout -b main
```

**Explanation:**

- `git checkout` is used to switch branches or restore working tree files.
    
- The `-b` flag tells Git to **create a new branch** and switch to it immediately.
    
- `main` is the **name of the new branch** being created.

Now Let's delete the `master` branch:

```bash
git branch -d master
```

- The `-d` flag stands for **delete**.
    
- Git will only delete the branch if it has been fully merged into your current branch (usually `main` or `master`).
    
- This is a safe delete to avoid losing any work that hasn’t been merged yet.


**Now let's create a remote repo on GitHub** **to link the project to**

**Install** GitHub CLI client ( Debian/Ubuntu )

```bash
sudo apt install gh
```

(Arch)
```bash
sudo pacman -S github-cli
```


**Login**
```
gh auth login
```

**Get in the path of your project**
```bash
cd /path/to/your/project
```

**Make the repo**
```
gh repo create git-test --public --source=. --remote=origin --push
```

