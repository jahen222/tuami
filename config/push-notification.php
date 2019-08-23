<?php

return array(

    'IOSUser'     => array(
        'environment' => env('IOS_USER_ENV', 'development'),
        'certificate' => app_path().'/apns/user/careCrewPushDev.pem',
        'passPhrase'  => env('IOS_USER_PUSH_PASS', 'appoets123$'),
        'service'     => 'apns'
    ),
    'IOSProvider' => array(
        'environment' => env('IOS_PROVIDER_ENV', 'development'),
        'certificate' => app_path().'/apns/provider/CareCrewProvider.pem',
        'passPhrase'  => env('IOS_PROVIDER_PUSH_PASS', 'appoets123$'),
        'service'     => 'apns'
    ),
    'AndroidUser' => array(
        'environment' => env('ANDROID_USER_ENV', 'production'),
        'apiKey'      => env('ANDROID_USER_PUSH_KEY', 'AAAAQzNCiOc:APA91bF-397F3sMGmR-q2R8NhvTrnxDtIN-PRtYJ9W_X2aGMsGzyfuoTlSd821hqjmBzaWa9mSwWc1l9KPRhJ_gEpcqvnQ3XqEJSo3OIkxebqIfu8QKblbCcCTGbFnN9zVNffDSzcO4S'),
        'service'     => 'gcm'
    ),
    'AndroidProvider' => array(
        'environment' => env('ANDROID_PROVIDER_ENV', 'production'),
        'apiKey'      => env('ANDROID_PROVIDER_PUSH_KEY', 'AAAAtWpuEwg:APA91bFPou7xblMkBX-iiTiRqj0rkPb_N19vRGfoyuAIbz548cc1IHJTl1LMbfykX0uGxGCRRxzES_i71Q1WnDjY_Y0otvFPC5_ifM1xHMcOmjBZ3_5P-PXjw5eyOrWQq-W9Lrh94syv
'),
        'service'     => 'gcm'
    )

);