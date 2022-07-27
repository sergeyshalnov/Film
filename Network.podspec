Pod::Spec.new do |s|
    s.name      = 'Network'
    s.summary   = "Network layer implementation"
    s.version   = '1.0.0'
    s.author    = { 'Sergey Shalnov' => 's.shalnov' }
    s.homepage  = 'https://github.com/sergeyshalnov'
    s.license   = { type: 'CUSTOM', text: "Copyright (c) #{Date.today.year} Sergey Shalnov" }
    s.source    = { http: 'https://github.com/sergeyshalnov' }

    s.ios.deployment_target = '13.0'
    s.swift_version = '5.0'
    s.source_files = "Development/#{s.name}/Source/**/*"
end