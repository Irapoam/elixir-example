defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.NewsResolver
  alias CommunityWeb.UsersResolver

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :function, non_null(:string)
  end

  query do
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &NewsResolver.all_links/3
    end

    field :all_users, non_null(list_of(non_null(:user))) do
      resolve &UsersResolver.all_users/3
    end
  end

  mutation do
    field :create_link, :link do
      arg :url, non_null(:string)
      arg :description, non_null(:string)

      resolve &NewsResolver.create_link/3
    end

    field :create_user, :user do
      arg :name, non_null(:string)
      arg :function, non_null(:string)

      resolve &UsersResolver.create_user/3
    end
  end
end
