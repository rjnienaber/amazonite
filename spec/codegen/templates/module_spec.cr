describe "module.cr.j2 template" do
  it "handles 'DynamoDB'" do
    source = ServiceJson.load("dynamodb-2012-08-10.normal.json")

    description = Amazonite::Codegen::Service::Description.new("0.23.2", "2012-08-10", "v2", source)
    render = Amazonite::Codegen::Render.new(description)
    actual = render.to_s("module.cr").strip

    expected = load_fixture("templates", "module", "module.expected.cr").strip
    actual.should eq_diff expected
  end
end
