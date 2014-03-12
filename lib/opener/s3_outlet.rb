require 'aws-sdk'

require_relative 's3_outlet/s3_output'
require_relative 's3_outlet/version'
require_relative 's3_outlet/server'

module Opener
  class S3Outlet
    def run(input, uuid)
      output = S3Output.new(:uuid=>uuid, :text=>input)
      output.save

      return input
    end
  end
end
