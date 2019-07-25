---
- name: Install and configure web service
  hosts:
    - servera.lab.example.com
    - serverb.lab.example.com
    - serverc.lab.example.com
    - serverd.lab.example.com

  tasks:
    - name: Install httpd
      yum:
        name: httpd
        state: latest

    - name: Tuning configuration installed
      copy:
        src: files/tune.conf
        dest: /etc/httpd/conf.d/tune.conf
        owner: root
        group: root
        mode: 0644
      notify:
        - restart httpd

    - name: Install firewalld
      yum:
        name: firewalld
        state: latest

    - name: Start the firewall
      service:
        name: firewalld
        enabled: true
        state: started

    - name: Open the port for http
      firewalld:
        service: http
        immediate: true
        permanent: true
        state: enabled

  handlers:
    - name: restart httpd
      service:
        name: httpd
        state: restarted
