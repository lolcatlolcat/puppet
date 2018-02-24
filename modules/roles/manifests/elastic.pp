class roles::elastic {
		case $osfamily {
			'debian': {
					$prereqs = ['vim', 'openjdk-8-jre-headless']
					exec { 'Update Ubuntu':
						path		=>		'/bin:/sbin:/usr/bin:/usr/sbin',
						command	=>		'apt update -y',
					} ->
					package { $prereqs :
						ensure	=>		'installed',
					}
				}
				'redhat': {
					$prereqs = ['vim', 'java-1.8.0-openjdk']
					package { $prereqs :
						ensure	=>	'installed',
					}
				}	
		}	
}
