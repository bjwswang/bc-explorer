#!/usr/bin/env bash

#
# Copyright 2023 The Bestchains Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -o errexit
set -o nounset
set -o pipefail

ROOT_PATH=$(dirname "${BASH_SOURCE[0]}")/..
source "${ROOT_PATH}/hack/lib/init.sh"

go::setup_env

echo "installing golangci-lint"
go install github.com/golangci/golangci-lint/cmd/golangci-lint

cd "${ROOT_PATH}"

echo "running golangci-lint"

if golangci-lint run ./...; then
	echo "golangci-lint verified."
else
	echo "golangci-lint failed."
	exit 1
fi
