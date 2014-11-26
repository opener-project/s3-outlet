#!/usr/bin/env ruby

require 'opener/daemons'

require_relative '../lib/opener/s3_outlet'

daemon = Opener::Daemons::Daemon.new(Opener::S3Outlet)

daemon.start
