$(document).ready(function() {
    'use strict';

    var createSVG = function (tag) {
        return $(document.createElementNS('http://www.w3.org/2000/svg', tag || 'svg'));
    };

    var toPoint = function (dx, dy, center) {
        return Math.round(dx + center.x) + ',' + Math.round(dy + center.y);
    };

    var hexClick = function (containerElement) {
        debugger
        var hex = $(this);
        containerElement.trigger($.Event('hexclick', hex.data()));
    };

    var createHex = function (radius, height, column, row, svgParent, cssClass, containerElement) {
        var center = {x:Math.round((1 + 1.5 * column) * radius), y: Math.round(height * (1 + row * 2 + (column % 2)))};
        createSVG('polygon').attr({
            points: [
                toPoint(-1 * radius / 2, -1 * height, center),
                toPoint(radius / 2, -1 * height, center),
                toPoint(radius, 0, center),
                toPoint(radius / 2, height, center),
                toPoint(-1 * radius / 2, height, center),
                toPoint(-1 * radius, 0, center)
            ].join(' '),
            'class':cssClass,
            tabindex:1
        }).appendTo(svgParent).data({center:center, row:row, column:column}).on('click', hexClick(containerElement)).attr({'hex-row': row, 'hex-column': column});
    }

    var generateHexGrid = function (containerElement, radius, columns, rows, cssClass) {
        return $(containerElement).each(function () {
            var containerElement = $(this),
                height = Math.sqrt(3) / 2 * radius,
                column, row, center,
                svgParent = createSVG('svg').attr('tabindex', 1).appendTo(containerElement).css({
                    width: (1.5 * columns  +  0.5) * radius,
                    height: (2 * rows  +  1) * height
                });

            for (row = 0; row < rows; row++) {
                for (column = 0; column < columns; column++) {
                    createHex(radius, height, column, row, svgParent, cssClass, containerElement)
                }
            }
        });
    };

    var rebuild = function () {
      var
        radius = parseInt($('#radius').val()),
        columns = parseInt($('#columns').val()),
        rows = parseInt($('#rows').val()),
        cssClass = 'hexfield';

      $('#container').empty();

      generateHexGrid($('#container'), radius, columns, rows, cssClass).on('hexclick', function (e) {
        $('#logger').text('clicked [' + e.column + ',' + e.row + '] hex with center at [' + e.center.x + ',' + e.center.y + '] px');
      });

      $('#container .hexfield').click(function () {
        this.classList.toggle('clicked');
      });
    };

    $('#rebuild').click(rebuild);
    rebuild();
})
