/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://haproxy/files/haproxy.cfg.tmpl
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      backends: {{ pillar['web_servers'] }}

net.ipv4.ip_nonlocal_bind:
  sysctl.present:
    - value: 1

/etc/keepalived/keepalived.conf:
  file.managed:
    - source: salt://haproxy/files/keepalived.conf.tmpl
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      hostname: {{ grains['host'] }}
      keepalived_state: {{ pillar['keepalived']['hosts'][grains['host']]['state'] }}
      vip: {{ pillar['keepalived']['vip'] }}
      priority: {{ pillar['keepalived']['hosts'][grains['host']]['priority'] }}

/etc/rsyslog.d/haproxy.conf:
  file.managed:
    - source: salt://haproxy/files/haproxy.conf.log.tmpl
    - user: root
    - group: root
    - mode: 644

/etc/default/haproxy:
  file.managed:
    - source: salt://haproxy/files/haproxy.default
    - user: root
    - group: root
    - mode: 644

rsyslog:
  service.running:
    - enable: True
    - require: 
      - file: /etc/rsyslog.d/haproxy.conf

haproxy:
  service.running:
      - enable: True
