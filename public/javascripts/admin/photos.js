$(document).ready(function() {
    $("ul.photo_gallery_photos").sortable({
        stop: function() {
            PhotoGallery.saveOrder();
        }
    });

    $("ul.photo_gallery_photos").disableSelection();
});

PhotoGallery = {
    getOrder: function() {
        var data = [];

        $("ul.photo_gallery_photos li").each(function(key, item) {
            data.push($(item).attr('data-id'));
        });

        return data;
    },

    saveOrder: function() {
        var order = PhotoGallery.getOrder();

        var params = $("ul.photo_gallery_photos").sortable('serialize', { 'key': 'children[]' });
        params += '&_method=put';
        params += '&' + $('meta[name=csrf-param]').attr('content') + '=' + $('meta[name=csrf-token]').attr('content');

        $.post('/admin/photo_galleries/' + PhotoGallery.getPhotoGalleryId() + '/sort', params, function(data) {
            $.growl("Photo Gallery Saved", "Photo Gallery successfully saved!");
        }, 'json');
    },

    getPhotoGalleryId: function() {
        return $("ul.photo_gallery_photos").first().attr('data-id');
    }
}