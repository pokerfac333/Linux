<p align="center">
<a target="blank"><img align="center" src="https://img.icons8.com/plasticine/344/bash.png" alt="Shell" height="100" /></a>
</p>

<h1 align="center">This script is for parsing file 💻</h1>

## 🟢 What the script can do? :
>✅ Takes a named argument **-f** or **--filename**

>✅ The script terminates if any of the commands returns an error

>✅ The script checks the file prefix, if the prefix is wrong, the script returns an error

>✅ The script creates a user with a random password

>✅ The script creates a group and adds users to the appropriate groups

>✅ After creating it and adding it to the group it displays on the **stdout [INFO]** :
```
 <dd::mm::yy:HH:MM> <username> was created and add to following group <group_names>
```
---
## 🟢 How to run the script? :

1.➡️ Clone the repository .

```sh
git clone https://github.com/pokerfac333/Linux.git
```

2.➡️ Navigate to the desired directory

```sh
cd ./Linux/scripts/parsing
```

3.➡️ Make Bash Script Executable

```sh
chmod +x parsing_file.sh
```

4.➡️ Run the script from the **root** or with **sudo**

```sh
./parsing_file.sh -f usersfile.csv
```