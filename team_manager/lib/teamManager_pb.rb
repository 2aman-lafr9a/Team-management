# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: teamManager.proto

require 'google/protobuf'


descriptor_data = "\n\x11teamManager.proto\x12\x0bteamManager\"#\n\x15GetTeamManagerRequest\x12\n\n\x02id\x18\x01 \x01(\x05\"K\n\x16GetTeamManagerResponse\x12\x31\n\x0bteamManager\x18\x01 \x01(\x0b\x32\x1c.teamManager.TeamManagerItem\"4\n\x16GetTeamManagersRequest\x12\x0c\n\x04page\x18\x01 \x01(\x05\x12\x0c\n\x04size\x18\x02 \x01(\x05\"\\\n\x17GetTeamManagersResponse\x12\x32\n\x0cteamManagers\x18\x01 \x03(\x0b\x32\x1c.teamManager.TeamManagerItem\x12\r\n\x05total\x18\x02 \x01(\x05\"f\n\x18\x43reateTeamManagerRequest\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x0f\n\x07surname\x18\x02 \x01(\t\x12\x0b\n\x03\x61ge\x18\x03 \x01(\t\x12\x0e\n\x06teamId\x18\x04 \x01(\t\x12\x0e\n\x06wallet\x18\x05 \x01(\t\"N\n\x19\x43reateTeamManagerResponse\x12\x31\n\x0bteamManager\x18\x01 \x01(\x0b\x32\x1c.teamManager.TeamManagerItem\"r\n\x18UpdateTeamManagerRequest\x12\n\n\x02id\x18\x01 \x01(\x05\x12\x0c\n\x04name\x18\x02 \x01(\t\x12\x0f\n\x07surname\x18\x03 \x01(\t\x12\x0b\n\x03\x61ge\x18\x04 \x01(\t\x12\x0e\n\x06teamId\x18\x05 \x01(\t\x12\x0e\n\x06wallet\x18\x06 \x01(\t\"N\n\x19UpdateTeamManagerResponse\x12\x31\n\x0bteamManager\x18\x01 \x01(\x0b\x32\x1c.teamManager.TeamManagerItem\"&\n\x18\x44\x65leteTeamManagerRequest\x12\n\n\x02id\x18\x01 \x01(\x05\",\n\x19\x44\x65leteTeamManagerResponse\x12\x0f\n\x07success\x18\x01 \x01(\x08\"i\n\x0fTeamManagerItem\x12\n\n\x02id\x18\x01 \x01(\x05\x12\x0c\n\x04name\x18\x02 \x01(\t\x12\x0f\n\x07surname\x18\x03 \x01(\t\x12\x0b\n\x03\x61ge\x18\x04 \x01(\x05\x12\x0e\n\x06teamId\x18\x05 \x01(\t\x12\x0e\n\x06wallet\x18\x06 \x01(\t2\xfc\x03\n\x0bTeamManager\x12[\n\x0eGetTeamManager\x12\".teamManager.GetTeamManagerRequest\x1a#.teamManager.GetTeamManagerResponse\"\x00\x12^\n\x0fGetTeamManagers\x12#.teamManager.GetTeamManagersRequest\x1a$.teamManager.GetTeamManagersResponse\"\x00\x12\x64\n\x11\x43reateTeamManager\x12%.teamManager.CreateTeamManagerRequest\x1a&.teamManager.CreateTeamManagerResponse\"\x00\x12\x64\n\x11UpdateTeamManager\x12%.teamManager.UpdateTeamManagerRequest\x1a&.teamManager.UpdateTeamManagerResponse\"\x00\x12\x64\n\x11\x44\x65leteTeamManager\x12%.teamManager.DeleteTeamManagerRequest\x1a&.teamManager.DeleteTeamManagerResponse\"\x00\x42)\n\'org.example.apigateway.grpc.teamManagerb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module TeamManager
  GetTeamManagerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.GetTeamManagerRequest").msgclass
  GetTeamManagerResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.GetTeamManagerResponse").msgclass
  GetTeamManagersRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.GetTeamManagersRequest").msgclass
  GetTeamManagersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.GetTeamManagersResponse").msgclass
  CreateTeamManagerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.CreateTeamManagerRequest").msgclass
  CreateTeamManagerResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.CreateTeamManagerResponse").msgclass
  UpdateTeamManagerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.UpdateTeamManagerRequest").msgclass
  UpdateTeamManagerResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.UpdateTeamManagerResponse").msgclass
  DeleteTeamManagerRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.DeleteTeamManagerRequest").msgclass
  DeleteTeamManagerResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.DeleteTeamManagerResponse").msgclass
  TeamManagerItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("teamManager.TeamManagerItem").msgclass
end
