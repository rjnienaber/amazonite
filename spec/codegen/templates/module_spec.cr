describe "module.cr.j2 template" do
  it "handles 'DynamoDB'" do
    source = ServiceJson.load("dynamodb-2012-08-10.normal.json")

    description = Amazonite::Codegen::Service::Description.new("0.23.2", source)
    service_binding = Amazonite::Codegen::Bindings::Service.new(description)

    render = Amazonite::Codegen::Render.new(service_binding)
    actual = render.to_s("module.cr").strip

    expected = load_fixture("templates", "module", "module.expected.cr").strip
    actual.should eq_diff expected
  end
end
