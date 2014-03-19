module Opener
  class S3Outlet
    class S3Output
       attr_accessor :params, :bucket
       attr_reader :uuid, :text, :dir

       def initialize(params = {})
         @uuid     = params.fetch(:uuid)
         @text     = params.fetch(:text)
         @dir      = params[:directory] || S3Outlet.dir
         @bucket   = params[:bucket]    || S3Outlet.bucket
       end

       def save
         object = bucket.objects[filename]
         object.write(text)
       end

       def self.find(uuid, dir=nil, bucket=nil)
         filename = construct_filename(uuid, dir)
         bucket = bucket || default_bucket

         if bucket.objects[filename].exists?
           file = bucket.objects[filename]
           return file.read
         else
           return nil
         end
       end

       def self.create(params={})
         new(params).save
       end

       def filename
         self.class.construct_filename(uuid, dir)
       end

       private

       def self.construct_filename(uuid, dir=nil)
         dir = S3Outlet.dir if dir.nil? || dir.empty?
         File.join(dir, "#{uuid}.kaf")
       end

       def self.default_bucket
         S3Outlet.bucket
       end
    end
  end
end
