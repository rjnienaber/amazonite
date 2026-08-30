private alias AAG = Amazonite::ApiGatewayV1
private alias Core = Amazonite::Core

module Amazonite::ApiGatewayV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.api_gateway_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("BackplaneControlService", "apigateway", "1.0", EXCEPTION_FACTORY, config)
    end

    # Create an ApiKey resource.
    def create_api_key(input : AAG::CreateApiKeyRequest) : Core::ParsedResponse(AAG::ApiKey)
      Log.info { "performing 'CreateApiKey' operation" }
      path = "/apikeys"
      headers = HTTP::Headers.new
      response = rest_request("CreateApiKey", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::ApiKey).new(response)
    end

    # Adds a new Authorizer resource to an existing RestApi resource.
    def create_authorizer(input : AAG::CreateAuthorizerRequest) : Core::ParsedResponse(AAG::Authorizer)
      Log.info { "performing 'CreateAuthorizer' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/authorizers"
      headers = HTTP::Headers.new
      response = rest_request("CreateAuthorizer", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Authorizer).new(response)
    end

    # Creates a new BasePathMapping resource.
    def create_base_path_mapping(input : AAG::CreateBasePathMappingRequest) : Core::ParsedResponse(AAG::BasePathMapping)
      Log.info { "performing 'CreateBasePathMapping' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}/basepathmappings"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("CreateBasePathMapping", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::BasePathMapping).new(response)
    end

    # Creates a Deployment resource, which makes a specified RestApi callable over the internet.
    def create_deployment(input : AAG::CreateDeploymentRequest) : Core::ParsedResponse(AAG::Deployment)
      Log.info { "performing 'CreateDeployment' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/deployments"
      headers = HTTP::Headers.new
      response = rest_request("CreateDeployment", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Deployment).new(response)
    end

    # Creates a documentation part.
    def create_documentation_part(input : AAG::CreateDocumentationPartRequest) : Core::ParsedResponse(AAG::DocumentationPart)
      Log.info { "performing 'CreateDocumentationPart' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/parts"
      headers = HTTP::Headers.new
      response = rest_request("CreateDocumentationPart", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DocumentationPart).new(response)
    end

    # Creates a documentation version
    def create_documentation_version(input : AAG::CreateDocumentationVersionRequest) : Core::ParsedResponse(AAG::DocumentationVersion)
      Log.info { "performing 'CreateDocumentationVersion' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/versions"
      headers = HTTP::Headers.new
      response = rest_request("CreateDocumentationVersion", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DocumentationVersion).new(response)
    end

    # Creates a new domain name.
    def create_domain_name(input : AAG::CreateDomainNameRequest) : Core::ParsedResponse(AAG::DomainName)
      Log.info { "performing 'CreateDomainName' operation" }
      path = "/domainnames"
      headers = HTTP::Headers.new
      response = rest_request("CreateDomainName", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DomainName).new(response)
    end

    # Creates a domain name access association resource between an access association source and a
    # private custom domain name.
    def create_domain_name_access_association(input : AAG::CreateDomainNameAccessAssociationRequest) : Core::ParsedResponse(AAG::DomainNameAccessAssociation)
      Log.info { "performing 'CreateDomainNameAccessAssociation' operation" }
      path = "/domainnameaccessassociations"
      headers = HTTP::Headers.new
      response = rest_request("CreateDomainNameAccessAssociation", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DomainNameAccessAssociation).new(response)
    end

    # Adds a new Model resource to an existing RestApi resource.
    def create_model(input : AAG::CreateModelRequest) : Core::ParsedResponse(AAG::Model)
      Log.info { "performing 'CreateModel' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/models"
      headers = HTTP::Headers.new
      response = rest_request("CreateModel", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Model).new(response)
    end

    # Creates a RequestValidator of a given RestApi.
    def create_request_validator(input : AAG::CreateRequestValidatorRequest) : Core::ParsedResponse(AAG::RequestValidator)
      Log.info { "performing 'CreateRequestValidator' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/requestvalidators"
      headers = HTTP::Headers.new
      response = rest_request("CreateRequestValidator", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::RequestValidator).new(response)
    end

    # Creates a Resource resource.
    def create_resource(input : AAG::CreateResourceRequest) : Core::ParsedResponse(AAG::Resource)
      Log.info { "performing 'CreateResource' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.parent_id)}"
      headers = HTTP::Headers.new
      response = rest_request("CreateResource", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Resource).new(response)
    end

    # Creates a new RestApi resource.
    def create_rest_api(input : AAG::CreateRestApiRequest) : Core::ParsedResponse(AAG::RestApi)
      Log.info { "performing 'CreateRestApi' operation" }
      path = "/restapis"
      headers = HTTP::Headers.new
      response = rest_request("CreateRestApi", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::RestApi).new(response)
    end

    # Creates a new Stage resource that references a pre-existing Deployment for the API.
    def create_stage(input : AAG::CreateStageRequest) : Core::ParsedResponse(AAG::Stage)
      Log.info { "performing 'CreateStage' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages"
      headers = HTTP::Headers.new
      response = rest_request("CreateStage", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Stage).new(response)
    end

    # Creates a usage plan with the throttle and quota limits, as well as the associated API stages,
    # specified in the payload.
    def create_usage_plan(input : AAG::CreateUsagePlanRequest) : Core::ParsedResponse(AAG::UsagePlan)
      Log.info { "performing 'CreateUsagePlan' operation" }
      path = "/usageplans"
      headers = HTTP::Headers.new
      response = rest_request("CreateUsagePlan", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::UsagePlan).new(response)
    end

    # Creates a usage plan key for adding an existing API key to a usage plan.
    def create_usage_plan_key(input : AAG::CreateUsagePlanKeyRequest) : Core::ParsedResponse(AAG::UsagePlanKey)
      Log.info { "performing 'CreateUsagePlanKey' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}/keys"
      headers = HTTP::Headers.new
      response = rest_request("CreateUsagePlanKey", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::UsagePlanKey).new(response)
    end

    # Creates a VPC link, under the caller's account in a selected region, in an asynchronous
    # operation that typically takes 2-4 minutes to complete and become operational. The caller must
    # have permissions to create and update VPC Endpoint services.
    def create_vpc_link(input : AAG::CreateVpcLinkRequest) : Core::ParsedResponse(AAG::VpcLink)
      Log.info { "performing 'CreateVpcLink' operation" }
      path = "/vpclinks"
      headers = HTTP::Headers.new
      response = rest_request("CreateVpcLink", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::VpcLink).new(response)
    end

    # Deletes the ApiKey resource.
    def delete_api_key(input : AAG::DeleteApiKeyRequest) : Core::Response
      Log.info { "performing 'DeleteApiKey' operation" }
      path = "/apikeys/#{URI.encode_path_segment(input.api_key)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteApiKey", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes an existing Authorizer resource.
    def delete_authorizer(input : AAG::DeleteAuthorizerRequest) : Core::Response
      Log.info { "performing 'DeleteAuthorizer' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/authorizers/#{URI.encode_path_segment(input.authorizer_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteAuthorizer", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes the BasePathMapping resource.
    def delete_base_path_mapping(input : AAG::DeleteBasePathMappingRequest) : Core::Response
      Log.info { "performing 'DeleteBasePathMapping' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}/basepathmappings/#{URI.encode_path_segment(input.base_path)}"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteBasePathMapping", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes the ClientCertificate resource.
    def delete_client_certificate(input : AAG::DeleteClientCertificateRequest) : Core::Response
      Log.info { "performing 'DeleteClientCertificate' operation" }
      path = "/clientcertificates/#{URI.encode_path_segment(input.client_certificate_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteClientCertificate", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a Deployment resource. Deleting a deployment will only succeed if there are no Stage
    # resources associated with it.
    def delete_deployment(input : AAG::DeleteDeploymentRequest) : Core::Response
      Log.info { "performing 'DeleteDeployment' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/deployments/#{URI.encode_path_segment(input.deployment_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteDeployment", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a documentation part
    def delete_documentation_part(input : AAG::DeleteDocumentationPartRequest) : Core::Response
      Log.info { "performing 'DeleteDocumentationPart' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/parts/#{URI.encode_path_segment(input.documentation_part_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteDocumentationPart", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a documentation version.
    def delete_documentation_version(input : AAG::DeleteDocumentationVersionRequest) : Core::Response
      Log.info { "performing 'DeleteDocumentationVersion' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/versions/#{URI.encode_path_segment(input.documentation_version)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteDocumentationVersion", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes the DomainName resource.
    def delete_domain_name(input : AAG::DeleteDomainNameRequest) : Core::Response
      Log.info { "performing 'DeleteDomainName' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteDomainName", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes the DomainNameAccessAssociation resource.
    #
    # Only the AWS account that created the DomainNameAccessAssociation resource can delete it. To
    # stop an access association source in another AWS account from accessing your private custom
    # domain name, use the RejectDomainNameAccessAssociation operation.
    def delete_domain_name_access_association(input : AAG::DeleteDomainNameAccessAssociationRequest) : Core::Response
      Log.info { "performing 'DeleteDomainNameAccessAssociation' operation" }
      path = "/domainnameaccessassociations/#{URI.encode_path_segment(input.domain_name_access_association_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteDomainNameAccessAssociation", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Clears any customization of a GatewayResponse of a specified response type on the given RestApi
    # and resets it with the default settings.
    def delete_gateway_response(input : AAG::DeleteGatewayResponseRequest) : Core::Response
      Log.info { "performing 'DeleteGatewayResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/gatewayresponses/#{URI.encode_path_segment(input.response_type)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteGatewayResponse", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Represents a delete integration.
    def delete_integration(input : AAG::DeleteIntegrationRequest) : Core::Response
      Log.info { "performing 'DeleteIntegration' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration"
      headers = HTTP::Headers.new
      response = rest_request("DeleteIntegration", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Represents a delete integration response.
    def delete_integration_response(input : AAG::DeleteIntegrationResponseRequest) : Core::Response
      Log.info { "performing 'DeleteIntegrationResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteIntegrationResponse", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes an existing Method resource.
    def delete_method(input : AAG::DeleteMethodRequest) : Core::Response
      Log.info { "performing 'DeleteMethod' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteMethod", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes an existing MethodResponse resource.
    def delete_method_response(input : AAG::DeleteMethodResponseRequest) : Core::Response
      Log.info { "performing 'DeleteMethodResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteMethodResponse", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a model.
    def delete_model(input : AAG::DeleteModelRequest) : Core::Response
      Log.info { "performing 'DeleteModel' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/models/#{URI.encode_path_segment(input.model_name)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteModel", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a RequestValidator of a given RestApi.
    def delete_request_validator(input : AAG::DeleteRequestValidatorRequest) : Core::Response
      Log.info { "performing 'DeleteRequestValidator' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/requestvalidators/#{URI.encode_path_segment(input.request_validator_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteRequestValidator", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a Resource resource.
    def delete_resource(input : AAG::DeleteResourceRequest) : Core::Response
      Log.info { "performing 'DeleteResource' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteResource", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes the specified API.
    def delete_rest_api(input : AAG::DeleteRestApiRequest) : Core::Response
      Log.info { "performing 'DeleteRestApi' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteRestApi", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a Stage resource.
    def delete_stage(input : AAG::DeleteStageRequest) : Core::Response
      Log.info { "performing 'DeleteStage' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteStage", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a usage plan of a given plan Id.
    def delete_usage_plan(input : AAG::DeleteUsagePlanRequest) : Core::Response
      Log.info { "performing 'DeleteUsagePlan' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteUsagePlan", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a usage plan key and remove the underlying API key from the associated usage plan.
    def delete_usage_plan_key(input : AAG::DeleteUsagePlanKeyRequest) : Core::Response
      Log.info { "performing 'DeleteUsagePlanKey' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}/keys/#{URI.encode_path_segment(input.key_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteUsagePlanKey", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes an existing VpcLink of a specified identifier.
    def delete_vpc_link(input : AAG::DeleteVpcLinkRequest) : Core::Response
      Log.info { "performing 'DeleteVpcLink' operation" }
      path = "/vpclinks/#{URI.encode_path_segment(input.vpc_link_id)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteVpcLink", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Flushes all authorizer cache entries on a stage.
    def flush_stage_authorizers_cache(input : AAG::FlushStageAuthorizersCacheRequest) : Core::Response
      Log.info { "performing 'FlushStageAuthorizersCache' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}/cache/authorizers"
      headers = HTTP::Headers.new
      response = rest_request("FlushStageAuthorizersCache", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Flushes a stage's cache.
    def flush_stage_cache(input : AAG::FlushStageCacheRequest) : Core::Response
      Log.info { "performing 'FlushStageCache' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}/cache/data"
      headers = HTTP::Headers.new
      response = rest_request("FlushStageCache", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Generates a ClientCertificate resource.
    def generate_client_certificate(input : AAG::GenerateClientCertificateRequest) : Core::ParsedResponse(AAG::ClientCertificate)
      Log.info { "performing 'GenerateClientCertificate' operation" }
      path = "/clientcertificates"
      headers = HTTP::Headers.new
      response = rest_request("GenerateClientCertificate", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::ClientCertificate).new(response)
    end

    # Gets information about the current Account resource.
    def get_account(input : AAG::GetAccountRequest) : Core::ParsedResponse(AAG::Account)
      Log.info { "performing 'GetAccount' operation" }
      path = "/account"
      headers = HTTP::Headers.new
      response = rest_request("GetAccount", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Account).new(response)
    end

    # Gets information about the current ApiKey resource.
    def get_api_key(input : AAG::GetApiKeyRequest) : Core::ParsedResponse(AAG::ApiKey)
      Log.info { "performing 'GetApiKey' operation" }
      path = "/apikeys/#{URI.encode_path_segment(input.api_key)}"
      query = URI::Params.build do |form|
        if value = input.include_value.try(&.to_s)
          form.add("includeValue", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetApiKey", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::ApiKey).new(response)
    end

    # Gets information about the current ApiKeys resource.
    def get_api_keys(input : AAG::GetApiKeysRequest) : Core::ParsedResponse(AAG::ApiKeys)
      Log.info { "performing 'GetApiKeys' operation" }
      path = "/apikeys"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
        if value = input.name_query
          form.add("name", value)
        end
        if value = input.customer_id
          form.add("customerId", value)
        end
        if value = input.include_values.try(&.to_s)
          form.add("includeValues", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetApiKeys", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::ApiKeys).new(response)
    end

    # Describe an existing Authorizer resource.
    def get_authorizer(input : AAG::GetAuthorizerRequest) : Core::ParsedResponse(AAG::Authorizer)
      Log.info { "performing 'GetAuthorizer' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/authorizers/#{URI.encode_path_segment(input.authorizer_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetAuthorizer", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Authorizer).new(response)
    end

    # Describe an existing Authorizers resource.
    def get_authorizers(input : AAG::GetAuthorizersRequest) : Core::ParsedResponse(AAG::Authorizers)
      Log.info { "performing 'GetAuthorizers' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/authorizers"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetAuthorizers", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Authorizers).new(response)
    end

    # Describe a BasePathMapping resource.
    def get_base_path_mapping(input : AAG::GetBasePathMappingRequest) : Core::ParsedResponse(AAG::BasePathMapping)
      Log.info { "performing 'GetBasePathMapping' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}/basepathmappings/#{URI.encode_path_segment(input.base_path)}"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetBasePathMapping", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::BasePathMapping).new(response)
    end

    # Represents a collection of BasePathMapping resources.
    def get_base_path_mappings(input : AAG::GetBasePathMappingsRequest) : Core::ParsedResponse(AAG::BasePathMappings)
      Log.info { "performing 'GetBasePathMappings' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}/basepathmappings"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetBasePathMappings", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::BasePathMappings).new(response)
    end

    # Gets information about the current ClientCertificate resource.
    def get_client_certificate(input : AAG::GetClientCertificateRequest) : Core::ParsedResponse(AAG::ClientCertificate)
      Log.info { "performing 'GetClientCertificate' operation" }
      path = "/clientcertificates/#{URI.encode_path_segment(input.client_certificate_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetClientCertificate", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::ClientCertificate).new(response)
    end

    # Gets a collection of ClientCertificate resources.
    def get_client_certificates(input : AAG::GetClientCertificatesRequest) : Core::ParsedResponse(AAG::ClientCertificates)
      Log.info { "performing 'GetClientCertificates' operation" }
      path = "/clientcertificates"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetClientCertificates", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::ClientCertificates).new(response)
    end

    # Gets information about a Deployment resource.
    def get_deployment(input : AAG::GetDeploymentRequest) : Core::ParsedResponse(AAG::Deployment)
      Log.info { "performing 'GetDeployment' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/deployments/#{URI.encode_path_segment(input.deployment_id)}"
      query = URI::Params.build do |form|
        (input.embed || [] of String).each do |value|
          form.add("embed", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDeployment", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Deployment).new(response)
    end

    # Gets information about a Deployments collection.
    def get_deployments(input : AAG::GetDeploymentsRequest) : Core::ParsedResponse(AAG::Deployments)
      Log.info { "performing 'GetDeployments' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/deployments"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDeployments", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Deployments).new(response)
    end

    # Gets a documentation part.
    def get_documentation_part(input : AAG::GetDocumentationPartRequest) : Core::ParsedResponse(AAG::DocumentationPart)
      Log.info { "performing 'GetDocumentationPart' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/parts/#{URI.encode_path_segment(input.documentation_part_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetDocumentationPart", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DocumentationPart).new(response)
    end

    # Gets documentation parts.
    def get_documentation_parts(input : AAG::GetDocumentationPartsRequest) : Core::ParsedResponse(AAG::DocumentationParts)
      Log.info { "performing 'GetDocumentationParts' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/parts"
      query = URI::Params.build do |form|
        if value = input.type.try(&.to_json_object_key)
          form.add("type", value)
        end
        if value = input.name_query
          form.add("name", value)
        end
        if value = input.path
          form.add("path", value)
        end
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
        if value = input.location_status.try(&.to_json_object_key)
          form.add("locationStatus", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDocumentationParts", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DocumentationParts).new(response)
    end

    # Gets a documentation version.
    def get_documentation_version(input : AAG::GetDocumentationVersionRequest) : Core::ParsedResponse(AAG::DocumentationVersion)
      Log.info { "performing 'GetDocumentationVersion' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/versions/#{URI.encode_path_segment(input.documentation_version)}"
      headers = HTTP::Headers.new
      response = rest_request("GetDocumentationVersion", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DocumentationVersion).new(response)
    end

    # Gets documentation versions.
    def get_documentation_versions(input : AAG::GetDocumentationVersionsRequest) : Core::ParsedResponse(AAG::DocumentationVersions)
      Log.info { "performing 'GetDocumentationVersions' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/versions"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDocumentationVersions", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DocumentationVersions).new(response)
    end

    # Represents a domain name that is contained in a simpler, more intuitive URL that can be called.
    def get_domain_name(input : AAG::GetDomainNameRequest) : Core::ParsedResponse(AAG::DomainName)
      Log.info { "performing 'GetDomainName' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDomainName", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DomainName).new(response)
    end

    # Represents a collection on DomainNameAccessAssociations resources.
    def get_domain_name_access_associations(input : AAG::GetDomainNameAccessAssociationsRequest) : Core::ParsedResponse(AAG::DomainNameAccessAssociations)
      Log.info { "performing 'GetDomainNameAccessAssociations' operation" }
      path = "/domainnameaccessassociations"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
        if value = input.resource_owner.try(&.to_json_object_key)
          form.add("resourceOwner", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDomainNameAccessAssociations", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DomainNameAccessAssociations).new(response)
    end

    # Represents a collection of DomainName resources.
    def get_domain_names(input : AAG::GetDomainNamesRequest) : Core::ParsedResponse(AAG::DomainNames)
      Log.info { "performing 'GetDomainNames' operation" }
      path = "/domainnames"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
        if value = input.resource_owner.try(&.to_json_object_key)
          form.add("resourceOwner", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDomainNames", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::DomainNames).new(response)
    end

    # Exports a deployed version of a RestApi in a specified format.
    def get_export(input : AAG::GetExportRequest) : Core::ParsedResponse(AAG::ExportResponse)
      Log.info { "performing 'GetExport' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}/exports/#{URI.encode_path_segment(input.export_type)}"
      headers = HTTP::Headers.new
      if value = input.accepts
        headers["Accept"] = value
      end
      response = rest_request("GetExport", "GET", path, headers, input.to_json)
      result = AAG::ExportResponse.new(
        content_type: response.headers["Content-Type"]?,
        content_disposition: response.headers["Content-Disposition"]?,
        body: response.body,
      )
      Core::ParsedResponse(AAG::ExportResponse).new(response, result)
    end

    # Gets a GatewayResponse of a specified response type on the given RestApi.
    def get_gateway_response(input : AAG::GetGatewayResponseRequest) : Core::ParsedResponse(AAG::GatewayResponse)
      Log.info { "performing 'GetGatewayResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/gatewayresponses/#{URI.encode_path_segment(input.response_type)}"
      headers = HTTP::Headers.new
      response = rest_request("GetGatewayResponse", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::GatewayResponse).new(response)
    end

    # Gets the GatewayResponses collection on the given RestApi. If an API developer has not added any
    # definitions for gateway responses, the result will be the API Gateway-generated default
    # GatewayResponses collection for the supported response types.
    def get_gateway_responses(input : AAG::GetGatewayResponsesRequest) : Core::ParsedResponse(AAG::GatewayResponses)
      Log.info { "performing 'GetGatewayResponses' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/gatewayresponses"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetGatewayResponses", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::GatewayResponses).new(response)
    end

    # Get the integration settings.
    def get_integration(input : AAG::GetIntegrationRequest) : Core::ParsedResponse(AAG::Integration)
      Log.info { "performing 'GetIntegration' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration"
      headers = HTTP::Headers.new
      response = rest_request("GetIntegration", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Integration).new(response)
    end

    # Represents a get integration response.
    def get_integration_response(input : AAG::GetIntegrationResponseRequest) : Core::ParsedResponse(AAG::IntegrationResponse)
      Log.info { "performing 'GetIntegrationResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("GetIntegrationResponse", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::IntegrationResponse).new(response)
    end

    # Describe an existing Method resource.
    def get_method(input : AAG::GetMethodRequest) : Core::ParsedResponse(AAG::Method)
      Log.info { "performing 'GetMethod' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}"
      headers = HTTP::Headers.new
      response = rest_request("GetMethod", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Method).new(response)
    end

    # Describes a MethodResponse resource.
    def get_method_response(input : AAG::GetMethodResponseRequest) : Core::ParsedResponse(AAG::MethodResponse)
      Log.info { "performing 'GetMethodResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("GetMethodResponse", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::MethodResponse).new(response)
    end

    # Describes an existing model defined for a RestApi resource.
    def get_model(input : AAG::GetModelRequest) : Core::ParsedResponse(AAG::Model)
      Log.info { "performing 'GetModel' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/models/#{URI.encode_path_segment(input.model_name)}"
      query = URI::Params.build do |form|
        if value = input.flatten.try(&.to_s)
          form.add("flatten", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetModel", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Model).new(response)
    end

    # Describes existing Models defined for a RestApi resource.
    def get_models(input : AAG::GetModelsRequest) : Core::ParsedResponse(AAG::Models)
      Log.info { "performing 'GetModels' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/models"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetModels", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Models).new(response)
    end

    # Generates a sample mapping template that can be used to transform a payload into the structure
    # of a model.
    def get_model_template(input : AAG::GetModelTemplateRequest) : Core::ParsedResponse(AAG::Template)
      Log.info { "performing 'GetModelTemplate' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/models/#{URI.encode_path_segment(input.model_name)}/default_template"
      headers = HTTP::Headers.new
      response = rest_request("GetModelTemplate", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Template).new(response)
    end

    # Gets a RequestValidator of a given RestApi.
    def get_request_validator(input : AAG::GetRequestValidatorRequest) : Core::ParsedResponse(AAG::RequestValidator)
      Log.info { "performing 'GetRequestValidator' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/requestvalidators/#{URI.encode_path_segment(input.request_validator_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetRequestValidator", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::RequestValidator).new(response)
    end

    # Gets the RequestValidators collection of a given RestApi.
    def get_request_validators(input : AAG::GetRequestValidatorsRequest) : Core::ParsedResponse(AAG::RequestValidators)
      Log.info { "performing 'GetRequestValidators' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/requestvalidators"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetRequestValidators", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::RequestValidators).new(response)
    end

    # Lists information about a resource.
    def get_resource(input : AAG::GetResourceRequest) : Core::ParsedResponse(AAG::Resource)
      Log.info { "performing 'GetResource' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}"
      query = URI::Params.build do |form|
        (input.embed || [] of String).each do |value|
          form.add("embed", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetResource", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Resource).new(response)
    end

    # Lists information about a collection of Resource resources.
    def get_resources(input : AAG::GetResourcesRequest) : Core::ParsedResponse(AAG::Resources)
      Log.info { "performing 'GetResources' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
        (input.embed || [] of String).each do |value|
          form.add("embed", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetResources", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Resources).new(response)
    end

    # Lists the RestApi resource in the collection.
    def get_rest_api(input : AAG::GetRestApiRequest) : Core::ParsedResponse(AAG::RestApi)
      Log.info { "performing 'GetRestApi' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetRestApi", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::RestApi).new(response)
    end

    # Lists the RestApis resources for your collection.
    def get_rest_apis(input : AAG::GetRestApisRequest) : Core::ParsedResponse(AAG::RestApis)
      Log.info { "performing 'GetRestApis' operation" }
      path = "/restapis"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetRestApis", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::RestApis).new(response)
    end

    # Generates a client SDK for a RestApi and Stage.
    def get_sdk(input : AAG::GetSdkRequest) : Core::ParsedResponse(AAG::SdkResponse)
      Log.info { "performing 'GetSdk' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}/sdks/#{URI.encode_path_segment(input.sdk_type)}"
      headers = HTTP::Headers.new
      response = rest_request("GetSdk", "GET", path, headers, input.to_json)
      result = AAG::SdkResponse.new(
        content_type: response.headers["Content-Type"]?,
        content_disposition: response.headers["Content-Disposition"]?,
        body: response.body,
      )
      Core::ParsedResponse(AAG::SdkResponse).new(response, result)
    end

    # Gets an SDK type.
    def get_sdk_type(input : AAG::GetSdkTypeRequest) : Core::ParsedResponse(AAG::SdkType)
      Log.info { "performing 'GetSdkType' operation" }
      path = "/sdktypes/#{URI.encode_path_segment(input.id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetSdkType", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::SdkType).new(response)
    end

    # Gets SDK types
    def get_sdk_types(input : AAG::GetSdkTypesRequest) : Core::ParsedResponse(AAG::SdkTypes)
      Log.info { "performing 'GetSdkTypes' operation" }
      path = "/sdktypes"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetSdkTypes", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::SdkTypes).new(response)
    end

    # Gets information about a Stage resource.
    def get_stage(input : AAG::GetStageRequest) : Core::ParsedResponse(AAG::Stage)
      Log.info { "performing 'GetStage' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}"
      headers = HTTP::Headers.new
      response = rest_request("GetStage", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Stage).new(response)
    end

    # Gets information about one or more Stage resources.
    def get_stages(input : AAG::GetStagesRequest) : Core::ParsedResponse(AAG::Stages)
      Log.info { "performing 'GetStages' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages"
      query = URI::Params.build do |form|
        if value = input.deployment_id
          form.add("deploymentId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetStages", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Stages).new(response)
    end

    # Gets the Tags collection for a given resource.
    def get_tags(input : AAG::GetTagsRequest) : Core::ParsedResponse(AAG::Tags)
      Log.info { "performing 'GetTags' operation" }
      path = "/tags/#{URI.encode_path_segment(input.resource_arn)}"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetTags", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Tags).new(response)
    end

    # Gets the usage data of a usage plan in a specified time interval.
    def get_usage(input : AAG::GetUsageRequest) : Core::ParsedResponse(AAG::Usage)
      Log.info { "performing 'GetUsage' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}/usage"
      query = URI::Params.build do |form|
        if value = input.key_id
          form.add("keyId", value)
        end
        if value = input.start_date
          form.add("startDate", value)
        end
        if value = input.end_date
          form.add("endDate", value)
        end
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetUsage", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::Usage).new(response)
    end

    # Gets a usage plan of a given plan identifier.
    def get_usage_plan(input : AAG::GetUsagePlanRequest) : Core::ParsedResponse(AAG::UsagePlan)
      Log.info { "performing 'GetUsagePlan' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetUsagePlan", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::UsagePlan).new(response)
    end

    # Gets a usage plan key of a given key identifier.
    def get_usage_plan_key(input : AAG::GetUsagePlanKeyRequest) : Core::ParsedResponse(AAG::UsagePlanKey)
      Log.info { "performing 'GetUsagePlanKey' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}/keys/#{URI.encode_path_segment(input.key_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetUsagePlanKey", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::UsagePlanKey).new(response)
    end

    # Gets all the usage plan keys representing the API keys added to a specified usage plan.
    def get_usage_plan_keys(input : AAG::GetUsagePlanKeysRequest) : Core::ParsedResponse(AAG::UsagePlanKeys)
      Log.info { "performing 'GetUsagePlanKeys' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}/keys"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
        if value = input.name_query
          form.add("name", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetUsagePlanKeys", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::UsagePlanKeys).new(response)
    end

    # Gets all the usage plans of the caller's account.
    def get_usage_plans(input : AAG::GetUsagePlansRequest) : Core::ParsedResponse(AAG::UsagePlans)
      Log.info { "performing 'GetUsagePlans' operation" }
      path = "/usageplans"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.key_id
          form.add("keyId", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetUsagePlans", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::UsagePlans).new(response)
    end

    # Gets a specified VPC link under the caller's account in a region.
    def get_vpc_link(input : AAG::GetVpcLinkRequest) : Core::ParsedResponse(AAG::VpcLink)
      Log.info { "performing 'GetVpcLink' operation" }
      path = "/vpclinks/#{URI.encode_path_segment(input.vpc_link_id)}"
      headers = HTTP::Headers.new
      response = rest_request("GetVpcLink", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::VpcLink).new(response)
    end

    # Gets the VpcLinks collection under the caller's account in a selected region.
    def get_vpc_links(input : AAG::GetVpcLinksRequest) : Core::ParsedResponse(AAG::VpcLinks)
      Log.info { "performing 'GetVpcLinks' operation" }
      path = "/vpclinks"
      query = URI::Params.build do |form|
        if value = input.position
          form.add("position", value)
        end
        if value = input.limit.try(&.to_s)
          form.add("limit", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetVpcLinks", "GET", path, headers, nil)
      Core::ParsedResponse(AAG::VpcLinks).new(response)
    end

    # Import API keys from an external source, such as a CSV-formatted file.
    def import_api_keys(input : AAG::ImportApiKeysRequest) : Core::ParsedResponse(AAG::ApiKeyIds)
      Log.info { "performing 'ImportApiKeys' operation" }
      path = "/apikeys?mode=import"
      query = URI::Params.build do |form|
        if value = input.format.try(&.to_json_object_key)
          form.add("format", value)
        end
        if value = input.fail_on_warnings.try(&.to_s)
          form.add("failonwarnings", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ImportApiKeys", "POST", path, headers, input.body)
      Core::ParsedResponse(AAG::ApiKeyIds).new(response)
    end

    # Imports documentation parts
    def import_documentation_parts(input : AAG::ImportDocumentationPartsRequest) : Core::ParsedResponse(AAG::DocumentationPartIds)
      Log.info { "performing 'ImportDocumentationParts' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/parts"
      query = URI::Params.build do |form|
        if value = input.mode.try(&.to_json_object_key)
          form.add("mode", value)
        end
        if value = input.fail_on_warnings.try(&.to_s)
          form.add("failonwarnings", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ImportDocumentationParts", "PUT", path, headers, input.body)
      Core::ParsedResponse(AAG::DocumentationPartIds).new(response)
    end

    # A feature of the API Gateway control service for creating a new API from an external API
    # definition file.
    def import_rest_api(input : AAG::ImportRestApiRequest) : Core::ParsedResponse(AAG::RestApi)
      Log.info { "performing 'ImportRestApi' operation" }
      path = "/restapis?mode=import"
      query = URI::Params.build do |form|
        if value = input.fail_on_warnings.try(&.to_s)
          form.add("failonwarnings", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ImportRestApi", "POST", path, headers, input.body)
      Core::ParsedResponse(AAG::RestApi).new(response)
    end

    # Creates a customization of a GatewayResponse of a specified response type and status code on the
    # given RestApi.
    def put_gateway_response(input : AAG::PutGatewayResponseRequest) : Core::ParsedResponse(AAG::GatewayResponse)
      Log.info { "performing 'PutGatewayResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/gatewayresponses/#{URI.encode_path_segment(input.response_type)}"
      headers = HTTP::Headers.new
      response = rest_request("PutGatewayResponse", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AAG::GatewayResponse).new(response)
    end

    # Sets up a method's integration.
    def put_integration(input : AAG::PutIntegrationRequest) : Core::ParsedResponse(AAG::Integration)
      Log.info { "performing 'PutIntegration' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration"
      headers = HTTP::Headers.new
      response = rest_request("PutIntegration", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Integration).new(response)
    end

    # Represents a put integration.
    def put_integration_response(input : AAG::PutIntegrationResponseRequest) : Core::ParsedResponse(AAG::IntegrationResponse)
      Log.info { "performing 'PutIntegrationResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("PutIntegrationResponse", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AAG::IntegrationResponse).new(response)
    end

    # Add a method to an existing Resource resource.
    def put_method(input : AAG::PutMethodRequest) : Core::ParsedResponse(AAG::Method)
      Log.info { "performing 'PutMethod' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}"
      headers = HTTP::Headers.new
      response = rest_request("PutMethod", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Method).new(response)
    end

    # Adds a MethodResponse to an existing Method resource.
    def put_method_response(input : AAG::PutMethodResponseRequest) : Core::ParsedResponse(AAG::MethodResponse)
      Log.info { "performing 'PutMethodResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("PutMethodResponse", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AAG::MethodResponse).new(response)
    end

    # A feature of the API Gateway control service for updating an existing API with an input of
    # external API definitions. The update can take the form of merging the supplied definition into
    # the existing API or overwriting the existing API.
    def put_rest_api(input : AAG::PutRestApiRequest) : Core::ParsedResponse(AAG::RestApi)
      Log.info { "performing 'PutRestApi' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}"
      query = URI::Params.build do |form|
        if value = input.mode.try(&.to_json_object_key)
          form.add("mode", value)
        end
        if value = input.fail_on_warnings.try(&.to_s)
          form.add("failonwarnings", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("PutRestApi", "PUT", path, headers, input.body)
      Core::ParsedResponse(AAG::RestApi).new(response)
    end

    # Rejects a domain name access association with a private custom domain name.
    #
    # To reject a domain name access association with an access association source in another AWS
    # account, use this operation. To remove a domain name access association with an access
    # association source in your own account, use the DeleteDomainNameAccessAssociation operation.
    def reject_domain_name_access_association(input : AAG::RejectDomainNameAccessAssociationRequest) : Core::Response
      Log.info { "performing 'RejectDomainNameAccessAssociation' operation" }
      path = "/rejectdomainnameaccessassociations"
      query = URI::Params.build do |form|
        if value = input.domain_name_access_association_arn
          form.add("domainNameAccessAssociationArn", value)
        end
        if value = input.domain_name_arn
          form.add("domainNameArn", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("RejectDomainNameAccessAssociation", "POST", path, headers, nil)
      Core::Response.new(response)
    end

    # Adds or updates a tag on a given resource.
    def tag_resource(input : AAG::TagResourceRequest) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      path = "/tags/#{URI.encode_path_segment(input.resource_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("TagResource", "PUT", path, headers, input.to_json)
      Core::Response.new(response)
    end

    # Simulate the execution of an Authorizer in your RestApi with headers, parameters, and an
    # incoming request body.
    def test_invoke_authorizer(input : AAG::TestInvokeAuthorizerRequest) : Core::ParsedResponse(AAG::TestInvokeAuthorizerResponse)
      Log.info { "performing 'TestInvokeAuthorizer' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/authorizers/#{URI.encode_path_segment(input.authorizer_id)}"
      headers = HTTP::Headers.new
      response = rest_request("TestInvokeAuthorizer", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::TestInvokeAuthorizerResponse).new(response)
    end

    # Simulate the invocation of a Method in your RestApi with headers, parameters, and an incoming
    # request body.
    def test_invoke_method(input : AAG::TestInvokeMethodRequest) : Core::ParsedResponse(AAG::TestInvokeMethodResponse)
      Log.info { "performing 'TestInvokeMethod' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}"
      headers = HTTP::Headers.new
      response = rest_request("TestInvokeMethod", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AAG::TestInvokeMethodResponse).new(response)
    end

    # Removes a tag from a given resource.
    def untag_resource(input : AAG::UntagResourceRequest) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      path = "/tags/#{URI.encode_path_segment(input.resource_arn)}"
      query = URI::Params.build do |form|
        (input.tag_keys || [] of String).each do |value|
          form.add("tagKeys", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("UntagResource", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Changes information about the current Account resource.
    def update_account(input : AAG::UpdateAccountRequest) : Core::ParsedResponse(AAG::Account)
      Log.info { "performing 'UpdateAccount' operation" }
      path = "/account"
      headers = HTTP::Headers.new
      response = rest_request("UpdateAccount", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Account).new(response)
    end

    # Changes information about an ApiKey resource.
    def update_api_key(input : AAG::UpdateApiKeyRequest) : Core::ParsedResponse(AAG::ApiKey)
      Log.info { "performing 'UpdateApiKey' operation" }
      path = "/apikeys/#{URI.encode_path_segment(input.api_key)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateApiKey", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::ApiKey).new(response)
    end

    # Updates an existing Authorizer resource.
    def update_authorizer(input : AAG::UpdateAuthorizerRequest) : Core::ParsedResponse(AAG::Authorizer)
      Log.info { "performing 'UpdateAuthorizer' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/authorizers/#{URI.encode_path_segment(input.authorizer_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateAuthorizer", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Authorizer).new(response)
    end

    # Changes information about the BasePathMapping resource.
    def update_base_path_mapping(input : AAG::UpdateBasePathMappingRequest) : Core::ParsedResponse(AAG::BasePathMapping)
      Log.info { "performing 'UpdateBasePathMapping' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}/basepathmappings/#{URI.encode_path_segment(input.base_path)}"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("UpdateBasePathMapping", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::BasePathMapping).new(response)
    end

    # Changes information about an ClientCertificate resource.
    def update_client_certificate(input : AAG::UpdateClientCertificateRequest) : Core::ParsedResponse(AAG::ClientCertificate)
      Log.info { "performing 'UpdateClientCertificate' operation" }
      path = "/clientcertificates/#{URI.encode_path_segment(input.client_certificate_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateClientCertificate", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::ClientCertificate).new(response)
    end

    # Changes information about a Deployment resource.
    def update_deployment(input : AAG::UpdateDeploymentRequest) : Core::ParsedResponse(AAG::Deployment)
      Log.info { "performing 'UpdateDeployment' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/deployments/#{URI.encode_path_segment(input.deployment_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateDeployment", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Deployment).new(response)
    end

    # Updates a documentation part.
    def update_documentation_part(input : AAG::UpdateDocumentationPartRequest) : Core::ParsedResponse(AAG::DocumentationPart)
      Log.info { "performing 'UpdateDocumentationPart' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/parts/#{URI.encode_path_segment(input.documentation_part_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateDocumentationPart", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DocumentationPart).new(response)
    end

    # Updates a documentation version.
    def update_documentation_version(input : AAG::UpdateDocumentationVersionRequest) : Core::ParsedResponse(AAG::DocumentationVersion)
      Log.info { "performing 'UpdateDocumentationVersion' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/documentation/versions/#{URI.encode_path_segment(input.documentation_version)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateDocumentationVersion", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DocumentationVersion).new(response)
    end

    # Changes information about the DomainName resource.
    def update_domain_name(input : AAG::UpdateDomainNameRequest) : Core::ParsedResponse(AAG::DomainName)
      Log.info { "performing 'UpdateDomainName' operation" }
      path = "/domainnames/#{URI.encode_path_segment(input.domain_name)}"
      query = URI::Params.build do |form|
        if value = input.domain_name_id
          form.add("domainNameId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("UpdateDomainName", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::DomainName).new(response)
    end

    # Updates a GatewayResponse of a specified response type on the given RestApi.
    def update_gateway_response(input : AAG::UpdateGatewayResponseRequest) : Core::ParsedResponse(AAG::GatewayResponse)
      Log.info { "performing 'UpdateGatewayResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/gatewayresponses/#{URI.encode_path_segment(input.response_type)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateGatewayResponse", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::GatewayResponse).new(response)
    end

    # Represents an update integration.
    def update_integration(input : AAG::UpdateIntegrationRequest) : Core::ParsedResponse(AAG::Integration)
      Log.info { "performing 'UpdateIntegration' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration"
      headers = HTTP::Headers.new
      response = rest_request("UpdateIntegration", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Integration).new(response)
    end

    # Represents an update integration response.
    def update_integration_response(input : AAG::UpdateIntegrationResponseRequest) : Core::ParsedResponse(AAG::IntegrationResponse)
      Log.info { "performing 'UpdateIntegrationResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/integration/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateIntegrationResponse", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::IntegrationResponse).new(response)
    end

    # Updates an existing Method resource.
    def update_method(input : AAG::UpdateMethodRequest) : Core::ParsedResponse(AAG::Method)
      Log.info { "performing 'UpdateMethod' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateMethod", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Method).new(response)
    end

    # Updates an existing MethodResponse resource.
    def update_method_response(input : AAG::UpdateMethodResponseRequest) : Core::ParsedResponse(AAG::MethodResponse)
      Log.info { "performing 'UpdateMethodResponse' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}/methods/#{URI.encode_path_segment(input.http_method)}/responses/#{URI.encode_path_segment(input.status_code)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateMethodResponse", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::MethodResponse).new(response)
    end

    # Changes information about a model. The maximum size of the model is 400 KB.
    def update_model(input : AAG::UpdateModelRequest) : Core::ParsedResponse(AAG::Model)
      Log.info { "performing 'UpdateModel' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/models/#{URI.encode_path_segment(input.model_name)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateModel", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Model).new(response)
    end

    # Updates a RequestValidator of a given RestApi.
    def update_request_validator(input : AAG::UpdateRequestValidatorRequest) : Core::ParsedResponse(AAG::RequestValidator)
      Log.info { "performing 'UpdateRequestValidator' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/requestvalidators/#{URI.encode_path_segment(input.request_validator_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateRequestValidator", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::RequestValidator).new(response)
    end

    # Changes information about a Resource resource.
    def update_resource(input : AAG::UpdateResourceRequest) : Core::ParsedResponse(AAG::Resource)
      Log.info { "performing 'UpdateResource' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/resources/#{URI.encode_path_segment(input.resource_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateResource", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Resource).new(response)
    end

    # Changes information about the specified API.
    def update_rest_api(input : AAG::UpdateRestApiRequest) : Core::ParsedResponse(AAG::RestApi)
      Log.info { "performing 'UpdateRestApi' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateRestApi", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::RestApi).new(response)
    end

    # Changes information about a Stage resource.
    def update_stage(input : AAG::UpdateStageRequest) : Core::ParsedResponse(AAG::Stage)
      Log.info { "performing 'UpdateStage' operation" }
      path = "/restapis/#{URI.encode_path_segment(input.rest_api_id)}/stages/#{URI.encode_path_segment(input.stage_name)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateStage", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Stage).new(response)
    end

    # Grants a temporary extension to the remaining quota of a usage plan associated with a specified
    # API key.
    def update_usage(input : AAG::UpdateUsageRequest) : Core::ParsedResponse(AAG::Usage)
      Log.info { "performing 'UpdateUsage' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}/keys/#{URI.encode_path_segment(input.key_id)}/usage"
      headers = HTTP::Headers.new
      response = rest_request("UpdateUsage", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::Usage).new(response)
    end

    # Updates a usage plan of a given plan Id.
    def update_usage_plan(input : AAG::UpdateUsagePlanRequest) : Core::ParsedResponse(AAG::UsagePlan)
      Log.info { "performing 'UpdateUsagePlan' operation" }
      path = "/usageplans/#{URI.encode_path_segment(input.usage_plan_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateUsagePlan", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::UsagePlan).new(response)
    end

    # Updates an existing VpcLink of a specified identifier.
    def update_vpc_link(input : AAG::UpdateVpcLinkRequest) : Core::ParsedResponse(AAG::VpcLink)
      Log.info { "performing 'UpdateVpcLink' operation" }
      path = "/vpclinks/#{URI.encode_path_segment(input.vpc_link_id)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateVpcLink", "PATCH", path, headers, input.to_json)
      Core::ParsedResponse(AAG::VpcLink).new(response)
    end
  end
end
