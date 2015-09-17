<?php
// Get full host (protocal + server host)
$protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') ? 'https://' : 'http://';
$full_host = $protocol . $_SERVER['HTTP_HOST'];

// Id of the application
$mno_settings->app_id = '{{ server_hostname }}';

// Enable Maestrano SOA for this app
$mno_settings->soa_enabled = {{ connec_enabled }};

// Name of your application
$mno_settings->app_name = '{{ app_name }}';

// Enable Maestrano SSO for this app
$mno_settings->sso_enabled = {{ sso_enabled }};

// SSO initialization URL
$mno_settings->sso_init_url = $full_host . '{{ sso_init_path }}';

// SSO processing url
$mno_settings->sso_return_url = $full_host . '{{ sso_consume_path }}';

// SOA initialization URL
$mno_settings->soa_init_url = $full_host . '{{ soa_init_path }}';

// API V1 Keys
$api_key = '{{ api_key }}';
$api_secret = '{{ api_secret }}';
