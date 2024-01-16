# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/team.proto

require 'google/protobuf'


descriptor_data = "\n\x10proto/team.proto\x12\x04team\"l\n\x11\x43reateTeamRequest\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\x12\r\n\x05owner\x18\x03 \x01(\t\x12\x11\n\tteam_logo\x18\x04 \x01(\t\x12\x12\n\nplayers_id\x18\x05 \x03(\t\" \n\x12\x43reateTeamResponse\x12\n\n\x02id\x18\x01 \x01(\t\"\x1c\n\x0eGetTeamRequest\x12\n\n\x02id\x18\x01 \x01(\t\"O\n\x0fGetTeamResponse\x12\n\n\x02id\x18\x01 \x01(\t\x12\x0c\n\x04name\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\x12\r\n\x05owner\x18\x04 \x01(\t\"Q\n\x11UpdateTeamRequest\x12\n\n\x02id\x18\x01 \x01(\t\x12\x0c\n\x04name\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\x12\r\n\x05owner\x18\x04 \x01(\t\" \n\x12UpdateTeamResponse\x12\n\n\x02id\x18\x01 \x01(\t\"\x1f\n\x11\x44\x65leteTeamRequest\x12\n\n\x02id\x18\x01 \x01(\t\" \n\x12\x44\x65leteTeamResponse\x12\n\n\x02id\x18\x01 \x01(\t\" \n\x0fGetTeamsRequest\x12\r\n\x05owner\x18\x01 \x01(\t\"1\n\x10GetTeamsResponse\x12\x1d\n\x05teams\x18\x01 \x03(\x0b\x32\x0e.team.TeamItem\"H\n\x08TeamItem\x12\n\n\x02id\x18\x01 \x01(\t\x12\x0c\n\x04name\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\x12\r\n\x05owner\x18\x04 \x01(\t2\xc6\x02\n\x04Team\x12\x41\n\nCreateTeam\x12\x17.team.CreateTeamRequest\x1a\x18.team.CreateTeamResponse\"\x00\x12\x38\n\x07GetTeam\x12\x14.team.GetTeamRequest\x1a\x15.team.GetTeamResponse\"\x00\x12\x41\n\nUpdateTeam\x12\x17.team.UpdateTeamRequest\x1a\x18.team.UpdateTeamResponse\"\x00\x12\x41\n\nDeleteTeam\x12\x17.team.DeleteTeamRequest\x1a\x18.team.DeleteTeamResponse\"\x00\x12;\n\x08GetTeams\x12\x15.team.GetTeamsRequest\x1a\x16.team.GetTeamsResponse\"\x00\x62\x06proto3"

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

module Team
  CreateTeamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.CreateTeamRequest").msgclass
  CreateTeamResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.CreateTeamResponse").msgclass
  GetTeamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.GetTeamRequest").msgclass
  GetTeamResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.GetTeamResponse").msgclass
  UpdateTeamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.UpdateTeamRequest").msgclass
  UpdateTeamResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.UpdateTeamResponse").msgclass
  DeleteTeamRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.DeleteTeamRequest").msgclass
  DeleteTeamResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.DeleteTeamResponse").msgclass
  GetTeamsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.GetTeamsRequest").msgclass
  GetTeamsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.GetTeamsResponse").msgclass
  TeamItem = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("team.TeamItem").msgclass
end
