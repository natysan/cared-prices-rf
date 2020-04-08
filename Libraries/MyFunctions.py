def split_phrase(phrase):
    return phrase.split()


def expected_navigation_pages(tot_results, elements_displayed):
    floor_d: int = int(tot_results) // int(elements_displayed)
    real_d = int(tot_results) / int(elements_displayed)
    if floor_d <= 0:
        return 0
    elif real_d > floor_d:
        floor_d += 1
        return floor_d


def build_xpath_for_pagination_items(base_xpath, indexs_to_replace):
    list_paths = []
    for i in range(1, indexs_to_replace):
        xpath = base_xpath + "[@data-dt-idx=" + str(i) + "]"
        list_paths.append(xpath)
    return list_paths


