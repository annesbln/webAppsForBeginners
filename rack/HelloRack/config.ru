# class Application
#     def call(env)
#         status = 200
#         headers = {"Content-Type" => "text/html"}
#         body = ["<html><head><title>Hi! I am the title</title></head><body><p>My <strong>first</strong> application</p></body></html>"]
#         p env
#         [status, headers, body]
#     end
# end

#run Application.new

# run by "rackup" in the terminal

class Application
    def call(env)
      puts inspect_env(env)
      [200, { "Content-Type" => "text/html" }, ["Yay, your first web application! <3"]]
    end
  
    def inspect_env(env)
      puts format('Request headers', request_headers(env))
      puts format('Server info', server_info(env))
      puts format('Rack info', rack_info(env))
    end
  
    def request_headers(env)
      env.select { |key, value| key.include?('HTTP_') }
    end
  
    def server_info(env)
      env.reject { |key, value| key.include?('HTTP_') or key.include?('rack.') }
    end
  
    def rack_info(env)
      env.select { |key, value| key.include?('rack.') }
    end
  
    def format(heading, pairs)
      [heading, "", format_pairs(pairs), "\n"].join("\n")
    end
  
    def format_pairs(pairs)
      pairs.map { |key, value| '  ' + [key, value.inspect].join(': ') }
    end
  end

run Application.new