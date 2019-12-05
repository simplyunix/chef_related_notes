# Chef
Chef Automation Cookbooks
This setup is for openstack driver
1. Openstack cloud platform setup, and working and ready # Not part of this
2. Chef server Centos-7
3. Chef workstation (I used windows) can use linux
  - Configure it to talk to Chef server
4. Install cmder (For unix like terminal)
5. Install vscode as your editor or use vi/vim

6. kitchen.yml (openstack driver)
7. Create a recipe (install_apache)
  - default.rb
  - templates
  - Create a index.html.erb file with all the web contents
8. Run test kitchen
  - kitchen test (Fix errors)
  - kitchen converge
  - kitchen destroy
