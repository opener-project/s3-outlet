module Opener
  class S3Outlet
    class S3Output
       attr_accessor :params, :bucket
       
       def initialize(params = {})
         @params = params
         
         s3     = AWS::S3.new      
         @bucket = s3.buckets[bucket_name]  
       end
       
       def save
         uuid     = params.fetch(:uuid)
         text     = params.fetch(:text) 
         filename = [uuid, ".kaf"].join
         object = bucket.objects[filename]
                  
         object.write(text)         
       end
       
       def find(uuid)
         filename = [uuid, ".kaf"].join
         
         if bucket.objects[filename].exists?
           file = bucket.objects[filename]
           return file.read
         else
           return nil
         end
       end
       
       private

       def bucket_name
         return "opener-outlet"
       end
    end
  end
end