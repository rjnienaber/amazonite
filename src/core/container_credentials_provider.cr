require "http/client"
require "uri"
require "./credentials_provider"

module Amazonite::Core
  # ECS/Fargate task role credentials - https://docs.aws.amazon.com/sdkref/latest/guide/feature-container-credentials.html
  class ContainerCredentialsProvider < CredentialsProvider
    def initialize(@env : Fetcher)
    end

    def credentials : Credentials?
      uri = resolve_uri
      return unless uri

      headers = HTTP::Headers.new
      auth_token = @env["AWS_CONTAINER_AUTHORIZATION_TOKEN"]?
      headers["Authorization"] = auth_token if auth_token

      client = HTTP::Client.new(uri)
      response = client.get(uri.request_target, headers)
      unless response.success?
        raise Exception.new("ECS container credentials endpoint returned status #{response.status_code}")
      end

      AwsCredentialsJson.from_json(response.body).to_credentials
    end

    private def resolve_uri : URI?
      if relative_uri = @env["AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"]?
        URI.parse("http://169.254.170.2#{relative_uri}")
      elsif full_uri = @env["AWS_CONTAINER_CREDENTIALS_FULL_URI"]?
        URI.parse(full_uri)
      end
    end
  end
end
