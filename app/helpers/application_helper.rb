module ApplicationHelper
    def default_meta_tags
        {
            site: 'かってに表彰状',
            title: 'かってに表彰状',
            reverse: true,
            separator: '|',
            description: '日頃頑張っているあいつのためにかってに表彰状を作成しよう！あなたの声はその人をきっと笑顔にする。',
            keywords: 'かってに表彰状,勝手に表彰状,かってにひょうしょうじょう',
            canonical: request.original_url,
            noindex: ! Rails.env.production?,
            icon: [
                { href: image_url('favicon.ico') },
                { href: image_url('logo2.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' }
                ],
            og: {
                site_name: 'かってに表彰状',
                title: 'かってに表彰状',
                description: '日頃頑張っているあいつのためにかってに表彰状を作成しよう！あなたの声はその人をきっと笑顔にする。', 
                type: 'website',
                url: request.original_url,
                image: image_url('logo-yellow.png'),
                locale: 'ja_JP',
            },
            twitter: {
                card: 'summary_large_image',
                site: '@kaiou_fight'
            }
        }
    end
end
