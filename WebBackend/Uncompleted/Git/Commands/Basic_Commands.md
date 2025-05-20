
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


Now lets change from master -> main :

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

Another commit on the new branch...
```bash
git commit -m 'New branch'
```

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

**Now let's change the link to the remote repo to make it point to make it point to our `main` branch as the default**

**First**
```bash
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
```

- Updates the **default remote branch pointer** for `origin` to point to `main`.
    
- This tells Git that the default branch on the remote (`origin/HEAD`) is now `main` instead of something else (e.g., `master`).
    
- Helps tools and commands (like `git clone` or `git remote show origin`) know that `main` is the main branch.

**Second**
```bash
git push -u origin main
```

- Pushes your **local `main` branch** to the remote repository named `origin` (e.g., GitHub).
    
- The `-u` (or `--set-upstream`) option **sets `origin/main` as the upstream branch** for your local `main`.
    
- This means future `git pull` and `git push` commands on `main` will automatically target `origin/main`.

now it is all set up.


Lets try to list the branches in the repo now:
```bash
git branch -a
```

- This lists **all branches** you have:
    
    - On your computer (local branches)
        
    - On the remote server (remote branches)
        
- You can see which branches exist and which one you are currently using (marked with a `*`).

The Output:
```R
* main
  remotes/origin/HEAD -> origin/main
  remotes/origin/main
```

- `* main`
	  
	- The asterisk (`*`) indicates that your **current local branch** is `main`.

- `remotes/origin/HEAD -> origin/main`
	
	- This means: **"the default branch on GitHub is `main`."**
	    
	- When you clone the repo, Git uses this to know where to start.
	    
	- It’s like saying: **“Follow `origin/main` when you ask for the default branch.”**

- `remotes/origin/main`
	
	- This is the **copy of the `main` branch from GitHub** stored on your computer.
	    
	- It updates whenever you run `git fetch` or `git pull`.
	    
	- It helps you compare your local branch with what’s on GitHub.


# But wait... What is `HEAD`?


### 1. What is `HEAD`?

- `HEAD` is a **special pointer (or variable)** in Git.
    
- It **points to the current branch** you are working on, or directly to a commit if in detached mode.
    
- Think of `HEAD` as **“where you are right now”** in your project’s history.

### 2. What does `HEAD` point to?

- Usually, it points to a **branch name** (e.g., `main`, `dev`).
    
- Indirectly, this means `HEAD` points to the **latest commit** on that branch.
    
- In some cases, it can point **directly to a commit** (called a "detached HEAD").


### 3. Why is `HEAD` important?

- When you commit, Git adds the new commit **at the point where `HEAD` points**.
    
- Commands like `git commit`, `git checkout`, and `git reset` use `HEAD` to know the current position.
    
- Switching branches updates `HEAD` to point to the new branch.

### 4. What is `remotes/origin/HEAD`?

- This is the **remote-tracking pointer** that tells your local Git which branch is the **default branch on the remote repository** (like GitHub).
    
- For example, if `remotes/origin/HEAD` points to `origin/main`, then `main` is the remote’s default branch.
    
- If you change `remotes/origin/HEAD` to `origin/dev`, then `dev` becomes the remote’s default branch.
    
- This helps Git and users know which branch to check out by default when cloning or interacting with the remote.

### 5. When does `remotes/origin/HEAD` exist?

- It is **automatically created** when cloning a repo.
    
- If you add a remote manually by making the repo locally on your machine and then creating the remote repo upon it to GitHub, it might not exist until you set it explicitly using:
```bash
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main
```
	
- This command tells Git what the default remote branch is.


### 6. What happens if you change `remotes/origin/HEAD` to point to another branch?

- The new branch becomes the **default branch** on the remote **from your local Git’s perspective**.
    
- Cloning the repo will start on that branch.
    
- GitHub also shows that branch as default if you update it on their web interface.

### 7. How to check where `HEAD` points in your local repo?

Run this command in your repo directory:

```bash
git symbolic-ref HEAD
```

Alternatively, to see the exact commit `HEAD` points to:
```bash
git rev-parse HEAD
```

- This prints the commit hash `HEAD` currently points to.


# `rm`

Removes a file from the working tree and the index. This can be pretty dangerous if you do not realize what you are doing. If you only want to remove the file from the working directory, and not the repository index, just use the normal **rm** command.

While you remove files from the repository, you do not remove them from the history, as that would be dishonest. If you want to remove a file that has been staged but not committed, you have to add the **-****cache** option, as in:

```bash
git add myfile

git rm myfile --cached
```


# **`mv`**

Renames a file and stages the new filename in the repository. It is equivalent to renaming the working file, and then doing a **git rm** on the old file name and a **git add** on the new one; i.e. the following operations are equivalent:

```bash
git mv oldfile newfile

# Equilvent:
mv oldfile newfile ; git rm oldfile ; git add newfile
```


# **`ls-files`**

Shows information about files in the index and working tree. By default, this command shows only files in the repository. If you want to show the untracked files, you can do:

```bash
git ls-files --others --exclude-standard
```

# **`diff`**

see the difference with the repository.

```bash
git diff --cached
```

(or `git diff --staged`)

Shows the changes that are **staged** (with `git add`) but **not yet committed**.


**Compare a branch to your current branch**

```bash
git diff main..dev
```


# `commit`

The `git commit` command is used to **save your staged changes** (from `git add`) into the repository history.

```bash
git commit -m "Your commit message"
```

| Command                  | Description                                     |
| ------------------------ | ----------------------------------------------- |
| `git commit -m "msg"`    | Commit with a message                           |
| `git commit -a -m "msg"` | Auto-stage tracked files, then commit           |
| `git commit -s -m "msg"` | Add `Signed-off-by:` line (used in open source) |
| `git commit --amend`     | Modify the last commit                          |

and after doing a commit you can do:

```bash
git diff
```

will show all differences between your staged working directories and what has been previously committed. After you do the commit, it will show nothing differing.

### Identifiers and Tags 

Every time you do a commit, git assigns a unique 160-bit 40-character hexadecimal hash value to it. While you can refer to those commits with these values, it is obviously unwieldy. For instance, taking an example from the Linux kernel source repository, we can see the history of commits with:

```bash
git log | grep "^commit" | head -10
```

If you want to refer to or revert to a certain commit, typing in such a long string is obviously a pain. You can instead create and use a tag. Thus, you could do:

```bash
git tag ver_10 08d869aa8683703c4a60fdc574dd0809f9b073cd
```

Now if you want to go to this commit you just need to enter this:

```bash
git checkout ver_10
```