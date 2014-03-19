require 'aws-sdk'

require_relative 's3_outlet/s3_output'
require_relative 's3_outlet/version'
require_relative 's3_outlet/server'

module Opener
  class S3Outlet

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
