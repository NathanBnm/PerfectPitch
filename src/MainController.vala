/*
* Copyright (c) 2019-2020 ArtemPopof
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Artem Popov <ArtemPopovSerg@gmail.com>
*/
public class MainController {
    private const string[] frequencies = {"31 Hz", "63 Hz", "125 Hz", "250 Hz", "500 Hz", "1 kHz", "2 kHz", "4 kHz", "8 kHz", "16 kHz"};
    private UiGameListener listener;
    private int frequency;

    public MainController (UiGameListener listener) {
        this.listener = listener;
    }

    public void start_game () {
        var random_freq_index = get_random_index (frequencies);
        var random_freq = frequencies[random_freq_index];

        var wrong_frequencies = get_random_wrong_freqs (random_freq_index);
        listener.game_started (wrong_frequencies);
    }

    private string[] get_random_wrong_freqs (int correct_freq_index) {
        var random_freqs = frequencies;
        random_freqs = delete_element (random_freqs, correct_freq_index);

        for (int i = 0; i < 5; i++) {
            var random_index = get_random_index (random_freqs);
            delete_element (random_freqs, random_index);
        }

        return random_freqs;
    }

    private string[] delete_element (string[] array, int element_index) {
        array.move (element_index + 1, element_index, array.length - element_index - 1);
        return array [0:array.length - 1];
    }

    private int get_random_index (string[] array) {
        return Random.int_range (0, array.length);
    }
}