require 'aws-sdk'

require_relative 's3_outlet/s3_output'
require_relative 's3_outlet/version'
require_relative 's3_outlet/server'
require 'opener/kaf_to_json'

module Opener
  class S3Outlet
    attr_reader :options

    def initialize(options={})
      @options = options
    end

    def run(input)
      options[:text] = input
      S3Output.create(options)

      return input #Return original input so that we can keep on chaining.
    end

    def self.s3
      @s3 ||= AWS::S3.new
    end

    def self.bucket
      @bucket ||= s3.buckets[bucket_name]
    end

    def self.bucket_name
      return "opener-outlet"
    end

    def self.dir
      return "webservice"
    end
  end
end
