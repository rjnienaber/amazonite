module Amazonite::Codegen::Service
  class Metadata
    private KNOWN_KEYS = ["apiVersion", "endpointPrefix", "protocol", "signatureVersion",
                          "jsonVersion", "serviceAbbreviation", "serviceFullName", "serviceId",
                          "targetPrefix", "uid", "signingName", "protocolSettings", "xmlNamespace"]

    getter version, endpoint_prefix, json_version, protocol, service_id, target_prefix

    def initialize(json : JSON::Any)
      Utils.verify_keys(KNOWN_KEYS, json)
      signature_version = json["signatureVersion"].as_s
      raise Exception.new("unsupported signature type: '#{signature_version}'") if signature_version != "v4"

      @version = json["apiVersion"].as_s
      @endpoint_prefix = json["endpointPrefix"].as_s
      @json_version = json["jsonVersion"]? ? json["jsonVersion"].as_s : "1.0"
      @protocol = json["protocol"].as_s
      @service_id = json["serviceId"].as_s
      @target_prefix = json["targetPrefix"]? ? json["targetPrefix"].as_s : @endpoint_prefix
    end
  end
end
