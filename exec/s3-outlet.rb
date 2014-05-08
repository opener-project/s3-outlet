#!/usr/bin/env ruby

require 'opener/daemons'
require_relative '../lib/opener/s3_outlet'

parser = Opener::Daemons::OptParser.new do |opts, options|
  opts.on("-b", "--bucket NAME", "Bucket name") do |v|
    options[:bucket] = v
  end
  opts.on("-d", "--directory NAME", "Directory name") do |v|
    options[:directory] = v
  end
end

class S3OutletFactory
  attr_reader :dir, :bucket

  def initialize(options)
    @bucket = options.fetch(:bucket)
    @dir    = options.fetch(:directory)
  end

  def new
    Opener::S3Outlet.new(:directory=>dir, :bucket=>bucket)
  end
end

options = parser.parse!(ARGV)
factory = S3OutletFactory.new(options)

daemon = Opener::Daemons::Daemon.new(factory, options)
daemon.start

