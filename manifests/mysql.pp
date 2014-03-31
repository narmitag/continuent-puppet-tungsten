# == Class: tungsten::mysql See README.md for documentation.
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

class tungsten::mysql (
	$masterUser			= $tungsten::mysql::params::masterUser,
	$masterPassword	= $tungsten::mysql::params::masterPassword,
	$port						= $tungsten::mysql::params::port,
	
	$serviceName		= $tungsten::mysql::params::serviceName,
) inherits tungsten::mysql::params {
  include tungsten::prereq
  
	class { "tungsten::mysql::server": } ->
	Class["tungsten::prereq"]
}
