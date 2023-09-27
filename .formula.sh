#!/usr/bin/env bash
set -euo pipefail

if [ -z "$FORMULA_VERSION_NO_V" ]; then
  echo "missing FORUMLA_VERSION_NO_V"
  exit 1
fi
if [ -z "$FORMULA_TGZ_SHA256" ]; then
  echo "missing FORMULA_TGZ_SHA256"
  exit 1
fi

cat << EOF
# typed: true
# frozen_string_literal: true

# This file was automatically generated. DO NOT EDIT.
class PeriodicDockerPull < Formula
  desc "Automatically pull a list of Docker image/tags on a regular basis."
  homepage "https://github.com/cdzombak/periodic-docker-pull"
  url "https://github.com/cdzombak/periodic-docker-pull/archive/v${FORMULA_VERSION_NO_V}.tar.gz"
  sha256 "${FORMULA_TGZ_SHA256}"
  license "LGPL-3.0"

  def install
    bin.install "_periodic-docker-pull"
  end

  test do
    assert_match("${FORMULA_VERSION_NO_V}", shell_output("#{bin}/_periodic-docker-pull -version"))
  end

  service do
    run opt_bin/"_periodic-docker-pull"
    run_type :interval
    interval 21600
    process_type :background
    log_path "/tmp/periodic-docker-pull.stdout.log"
    error_log_path "/tmp/periodic-docker-pull.stderr.log"
  end
end
EOF
