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

module Puppet::Parser::Functions
  newfunction(:getMySQLAutoIncrementOffset, :type => :rvalue) do |args|
    clusterHash = args[0]
    hostname = args[1]
    
    Puppet::Parser::Functions.autoloader.loadall
    availableMasters = function_getTungstenAvailableMasters([clusterHash])
    
    idx = availableMasters.index(hostname)
    if idx == nil
      return 1
    else
      return (idx+1)
    end
  end
end