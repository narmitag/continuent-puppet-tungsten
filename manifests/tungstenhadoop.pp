# == Class: tungsten::tungstenhadoop See README.md for documentation.
#
# Copyright (C) 2015 VMware, Inc.
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

class tungsten::tungstenhadoop (
	$distribution = false
) {
  anchor{"tungsten::tungstenhadoop::end": }

  if $distribution == "cdh5" {
    include tungsten::tungstenhadoop::tools

    class{ "tungsten::tungstenhadoop::cdh5": } ->
    Anchor["tungsten::tungstenhadoop::end"]
  } elsif $distribution != false {
    fail("The ${module_name} module is not able to install the ${distribution} Hadoop distribution.")
  }
}
