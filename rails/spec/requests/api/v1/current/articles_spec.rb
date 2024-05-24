# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Current::Articles', type: :request do
  describe 'POST api/v1/current/articles' do
    subject { post(api_v1_current_articles_path, headers:) }

    let(:headers) { current_user.create_new_auth_token }
    let(:current_user) { create(:user) }

    context 'ログインユーザーに紐づく未保存ステータスの記事が0件の時' do
      it '未保存ステータスの記事が新規作成される' do
        expect { subject }.to change { current_user.articles.count }.by(1)
        expect(current_user.articles.last).to be_unsaved
        res = JSON.parse(response.body)
        expect(res.keys).to eq %w[id title content status created_at from_today user]
        expect(res['user'].keys).to eq ['name']
        expect(response).to have_http_status(:ok)
      end
    end

    context 'ログインユーザーに紐づく未保存ステータスの記事が1件の時' do
      before { create(:article, user: current_user, status: :unsaved) }

      it '未保存ステータスの記事が新規作成される' do
        expect { subject }.not_to(change { current_user.articles.count })
        res = JSON.parse(response.body)
        expect(res.keys).to eq %w[id title content status created_at from_today user]
        expect(res['user'].keys).to eq ['name']
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH api/v1/current/articles' do
    subject { patch(api_v1_current_article_path(id), headers:, params:) }

    let(:headers) { current_user.create_new_auth_token }
    let(:current_user) { create(:user) }
    let(:other_user) { create(:user) }
    let(:params) { { "article": { "title": 'テストタイトル2', "content": 'テスト本文2', "status": 'published' } } }

    context ':id がログインユーザーに紐づく articles レコードの id である時' do
      let(:current_user_article) do
        create(:article, title: 'テストタイトル1', content: 'テスト本文1', status: :draft, user: current_user)
      end
      let(:id) { current_user_article.id }

      it '正常にレコードを更新できる' do
        expect { subject }.to change { current_user_article.reload.title }.from('テストタイトル1').to('テストタイトル2') and
          change { current_user_article.reload.content }.from('テスト本文1').to('テスト本文2') and
          change { current_user_article.reload.status }.from('draft').to('published')
        res = JSON.parse(response.body)
        expect(res.keys).to eq %w[id title content status created_at from_today user]
        expect(res['user'].keys).to eq ['name']
        expect(response).to have_http_status(:ok)
      end
    end

    context ':id がログインユーザーに紐づく articles レコードの id ではない時' do
      let(:other_user_article) { create(:article, user: other_user) }
      let(:id) { other_user_article.id }

      it '例外が発生する' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
