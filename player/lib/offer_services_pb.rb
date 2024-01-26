# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: offer.proto for package 'offer'

require 'grpc'
require 'offer_pb'

module Offer
  module Offer
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'offer.Offer'

      rpc :GetOffers, ::Offer::GetOffersRequest, ::Offer::GetOffersResponse
      rpc :GetOffer, ::Offer::GetOfferRequest, ::Offer::GetOfferResponse
      rpc :CreateOffer, ::Offer::CreateOfferRequest, ::Offer::CreateOfferResponse
      rpc :UpdateOffer, ::Offer::UpdateOfferRequest, ::Offer::UpdateOfferResponse
      rpc :DeleteOffer, ::Offer::DeleteOfferRequest, ::Offer::DeleteOfferResponse
      rpc :GetOfferById, ::Offer::GetOfferIdRequest, ::Offer::GetOfferIdResponse
    end

    Stub = Service.rpc_stub_class
  end
end
