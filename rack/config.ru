class Application
  def call(env)
    status = 200
    headers = { "Content-Type" => "text/html" }
    body = ["
      <html>
        <body>
          <h1>Yay, this is my very first web application with Rack! <3</h1>
          <p>This is just a text to test the content of the web application.</p>
          <h2>I think, this is pretty amazing.</h2>
        </body>
      </html>"]

    [status, headers, body]
  end
end

run Application.new