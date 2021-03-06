# == Class: tungsten::prereq::rvm See README.md for documentation.
#
# Copyright (C) 2014 Continuent, Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.  You may obtain
# a copy of the License at
# 
#         http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

class tungsten::prereq::rvm (
	$enabled = true
) inherits tungsten::prereq::unix_user {
	if $enabled == true {
		exec { "install-rvm":
			cwd => "/tmp/",
			command => "/usr/bin/curl curl -L https://get.rvm.io | bash -s stable",
			creates => "/usr/local/rvm/bin/rvm",
			require => Package[ruby],
		}
		
		User["tungsten::systemUser"] {
			groups +> ["rvm"],
			require +> [Exec["install-rvm"]]
		}
	}
}