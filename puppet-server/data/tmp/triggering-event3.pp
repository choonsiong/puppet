service { 'tinpot':
    ensure => running,
    enable => true,
    notify => Exec['clean tinpot cache']
}

exec { 'clean tinpot cache':
    path => '/opt/tinpot/bin',
    command => 'tinpot --cleancache',
    refreshonly => true,
}
