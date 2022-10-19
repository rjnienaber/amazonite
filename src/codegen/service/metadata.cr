module Amazonite::Codegen::Service
  class Metadata
    private KNOWN_KEYS = ["apiVersion", "endpointPrefix", "protocol", "signatureVersion",
                          "jsonVersion", "serviceAbbreviation", "serviceFullName", "serviceId",
                          "targetPrefix", "uid"]

    getter version, endpoint_prefix, protocol, service_id, target_prefix

    def initialize(json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      signature_version = json["signatureVersion"].as_s
      raise Exception.new("unsupported signature type: '#{signature_version}'") if signature_version != "v4"

      @version = json["apiVersion"].as_s
      @endpoint_prefix = json["endpointPrefix"].as_s
      @protocol = json["protocol"].as_s
      @service_id = json["serviceId"].as_s
      @target_prefix = json["targetPrefix"].as_s
    end
  end
end
