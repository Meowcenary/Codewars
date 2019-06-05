$(document).ready(function() {
    // global $, document
    var hexGridWidget = function (container_element, radius, columns, rows, cssClass) {
        // ???
        'use strict';

        // called throughout, will actually create the polygon element in the DOM
        var createSVG = function (tag) {
            return $(document.createElementNS('http://www.w3.org/2000/svg', tag || 'svg'));
        };

        return $(container_element).each(function () {
            var element = $(this),
                    // the encapsulated event that is triggered when a hex is clicked
                    hexClick = function () {
                        var hex = $(this);
                        element.trigger($.Event('hexclick', hex.data()));
                    },
                    height = Math.sqrt(3) / 2 * radius,
                    svgParent = createSVG('svg').attr('tabindex', 1).appendTo(element).css({
                        width: (1.5 * columns  +  0.5) * radius,
                        height: (2 * rows  +  1) * height
                    }),
                    column, row, center,
                    toPoint = function (dx, dy) {
                        return Math.round(dx + center.x) + ',' + Math.round(dy + center.y);
                    };

            for (row = 0; row < rows; row++) {
                for (column = 0; column < columns; column++) {
                    center = {x:Math.round((1 + 1.5 * column) * radius), y: Math.round(height * (1 + row * 2 + (column % 2)))};
                    createSVG('polygon').attr({
                        points: [
                            toPoint(-1 * radius / 2, -1 * height),
                            toPoint(radius / 2, -1 * height),
                            toPoint(radius, 0),
                            toPoint(radius / 2, height),
                            toPoint(-1 * radius / 2, height),
                            toPoint(-1 * radius, 0)
                        ].join(' '),
                        'class':cssClass,
                        tabindex:1
                    })
                    // .on adds trigger for click that calls hexClick function to raise expected event
                    // .attr gives the appended polygon element the data attributes 'hex-row' and 'hex-column'
                    .appendTo(svgParent).data({center:center, row:row, column:column}).on('click', hexClick).attr({'hex-row': row, 'hex-column': column});
                }
            }
        });
    };

    var evenColumnZoc = function (selected_row, selected_column) {
        hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row)) + "'][hex-column='" + (parseInt(selected_column)) + "']"
        hex = $(hex_selector)[0];
        hex.classList.toggle('clicked');

        // above hex
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) - 1) + "'][hex-column='" + (parseInt(selected_column)) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // hex to the right and up
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) - 1) + "'][hex-column='" + (parseInt(selected_column) + 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // // hex to the right and down
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row)) + "'][hex-column='" + (parseInt(selected_column) + 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // // hex below
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) + 1) + "'][hex-column='" + (parseInt(selected_column)) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // // hex to the left and down
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) - 1) + "'][hex-column='" + (parseInt(selected_column) - 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // // hex to the left and down
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row)) + "'][hex-column='" + (parseInt(selected_column) - 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
    }

    var oddColumnZoc = function (selected_row, selected_column) {
        hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row)) + "'][hex-column='" + (parseInt(selected_column)) + "']"
        hex = $(hex_selector)[0];
        hex.classList.toggle('clicked');

        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) - 1) + "'][hex-column='" + (parseInt(selected_column)) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // hex to the right and up
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) + 1) + "'][hex-column='" + (parseInt(selected_column) + 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // hex to the right and down
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row)) + "'][hex-column='" + (parseInt(selected_column) + 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // hex below
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) + 1) + "'][hex-column='" + (parseInt(selected_column)) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // hex to the left and down
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row) + 1) + "'][hex-column='" + (parseInt(selected_column) - 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
        // hex to the left and down
        next_hex_selector = "#container .hexfield[hex-row='"+ (parseInt(selected_row)) + "'][hex-column='" + (parseInt(selected_column) - 1) + "']"
        next_hex = $(next_hex_selector)[0];
        next_hex.classList.toggle('zoc');
    }

    var rebuild = function () {
      var
        radius = parseInt($('#radius').val()),
        columns = parseInt($('#columns').val()),
        rows = parseInt($('#rows').val()),
        cssClass = 'hexfield';

        $('#container').empty();

        hexGridWidget($('#container'), radius, columns, rows, cssClass).on('hexclick', function (e) {
            $('#logger').text('clicked [' + e.column + ',' + e.row + '] hex with center at [' + e.center.x + ',' + e.center.y + '] px');
        });

      $('#container .hexfield').click(function () {
        rebuild();
        hex = $(this);
        selected_column = hex.attr('hex-column');
        selected_row = hex.attr('hex-row');
        if (selected_column % 2 == 1) {
          oddColumnZoc(selected_row, selected_column);
        } else {
          evenColumnZoc(selected_row, selected_column);
        }
      });
    };

    $('#rebuild').click(rebuild);
    rebuild();
})
