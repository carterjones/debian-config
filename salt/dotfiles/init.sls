{% from 'macros.sls' import user, group with context %}

Copy shared dotfiles:
    file.recurse:
        - name: {{ salt['environ.get']('HOME') }}
        - source: salt://dotfiles/shared
        - template: jinja
        - show_changes: False # https://github.com/saltstack/salt/issues/46858#issuecomment-378658104
        {{ user() }}
        {{ group() }}

{% if grains['kernel'] == 'Linux' %}

Copy Linux dotfiles:
    file.recurse:
        - name: {{ salt['environ.get']('HOME') }}
        - source: salt://dotfiles/linux
        {{ user() }}
        {{ group() }}

{% elif grains['kernel'] == 'Darwin' %}

Copy Mac dotfiles:
    file.recurse:
        - name: {{ salt['environ.get']('HOME') }}
        - source: salt://dotfiles/mac
        {{ user() }}
        {{ group() }}

{% endif %}
