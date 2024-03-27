# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routing' do
  it 'routes GET /profiles/index to profiles#index' do
    expect(get: '/profiles/index').to route_to('profiles#index')
  end

  it 'routes POST /users/:id/follow to users#follow' do
    expect(post: '/users/1/follow').to route_to('users#follow', id: '1')
  end

  it 'routes DELETE /users/:id/unfollow to users#unfollow' do
    expect(delete: '/users/1/unfollow').to route_to('users#unfollow', id: '1')
  end

  # it 'routes POST /users/:id/accept to users#accept' do
  #   expect(post: '/users/1/accept').to route_to('users#accept', id: '1')
  # end
  #
  # it 'routes POST /users/:id/decline to users#decline' do
  #   expect(post: '/users/1/decline').to route_to('users#decline', id: '1')
  # end
  #
  # it 'routes DELETE /users/:id/cancel to users#cancel' do
  #   expect(delete: '/users/1/cancel').to route_to('users#cancel', id: '1')
  # end

  it 'routes GET /posts to posts#index' do
    expect(get: '/posts').to route_to('posts#index')
  end

  it 'routes GET /comments to comments#index' do
    expect(get: '/comments').to route_to('comments#index')
  end

  it 'routes POST /messages/:id/replies to messages#create_reply' do
    expect(post: '/messages/1/replies').to route_to('messages#create_reply', message_id: '1')
  end

  it 'routes GET /messages to messages#index' do
    expect(get: '/messages').to route_to('messages#index')
  end

  it 'routes GET /messages/new to messages#new' do
    expect(get: '/messages/new').to route_to('messages#new')
  end

  it 'routes POST /messages to messages#create' do
    expect(post: '/messages').to route_to('messages#create')
  end

  it 'routes DELETE /messages/:id to messages#destroy' do
    expect(delete: '/messages/1').to route_to('messages#destroy', id: '1')
  end

  it 'routes GET /messages/:id to messages#show' do
    expect(get: '/messages/1').to route_to('messages#show', id: '1')
  end
end
