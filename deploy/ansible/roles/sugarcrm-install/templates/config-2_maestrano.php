<?php

//------------------------------------
// SOA Configuration
//------------------------------------
// Maestrano SOA Host (Connec! URL)
$mno_soa_host = '{{ connec_hostname }}';

// Maestrano REST API version
$mno_soa_version = 'v1';

// SOA integration URL
$mno_settings->soa_url = $mno_soa_host . '/'. $mno_soa_version .'/';

//------------------------------------
// SSO Configuration
//------------------------------------
// Get Maestrano SSO Host (MNO URL)
$mno_sso_host = '{{ mno_hostname }}';

// Endpoint to reach for SSO Identification
$mno_settings->sso_url = $mno_sso_host . '/api/v1/auth/saml';

// Endpoint to reach for session information (/api/v1/auth/saml/user-xyz?session=df4sd4g3fd345sfgd534)
$mno_settings->sso_session_check_url = $mno_sso_host . '/api/v1/auth/saml';

// Access unauthorized page
$mno_settings->sso_access_unauthorized_url = $mno_sso_host . '/app_access_unauthorized';

// Access Logout page
$mno_settings->sso_access_logout_url = $mno_sso_host . '/app_logout';

// Intranet Mode - If enabled then ALL pages require authentication
$mno_settings->sso_intranet_mode = false;

// Maestrano X509 Certificate
$mno_settings->sso_x509_certificate = '{{ sso_certificate }}';

return $mno_settings;