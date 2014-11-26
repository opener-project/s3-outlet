module Opener
  class S3Outlet
    class Server < Webservice::Server
      set :views, File.expand_path('../views', __FILE__)

      self.text_processor  = S3Outlet
      self.accepted_params = [:request_id]

      get '/' do
        if params[:request_id]
          redirect "#{url("/")}#{params[:request_id]}"
        else
          erb :index
        end
      end

      get '/:request_id.json' do
        unless params[:request_id] == 'favicon.ico'
          output = S3Output.find(params[:request_id])

          if output
            content_type('text/json')
            kj = Opener::KafToJson.new
            json = kj.run(output.text) rescue output.text
            body(json)
          else
            halt(404, "No record found for ID #{params[:request_id]}")
          end
        end
      end

      get '/:request_id' do
        unless params[:request_id] == 'favicon.ico'
          output = S3Output.find(params[:request_id])

          if output
            content_type(:xml)
            body(output)
          else
            halt(404, "No record found for ID #{params[:request_id]}")
          end
        end
      end

      get '/html/:request_id' do
        unless params[:request_id] == 'favicon.ico'
          output = S3Output.find(params[:request_id])

          if output
            output = StringIO.new(output)
            parser = Opener::Kaf::Visualizer::Parser.new(output)
            doc    = parser.parse
            html   = Opener::Kaf::Visualizer::HTMLTextPresenter.new(doc)

            @parsed = html.to_html

            erb :show
          else
            halt(404, "No record found for ID #{params[:request_id]}")
          end
        end
      end
    end # Server
  end # S3Outlet
end # Opener
