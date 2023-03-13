class FlungryStepOption {

  final String item;
  final String description;
  final double price;
  final String img;
  final bool isSelected;
  final int index;

  const FlungryStepOption({
    required this.img,
    required this.item,
    required this.description,
    required this.price,
    required this.isSelected,
    required this.index
  });

  FlungryStepOption copyWith({
    String? item, 
    String? description,
    String? img,
    bool? isSelected,
    double? price,
    int? index
  }) {
    return FlungryStepOption(
      index: index ?? this.index,
      img: img ?? this.img, 
      item: item ?? this.item, 
      description: description ?? this.description, 
      price: price ?? this.price, 
      isSelected: isSelected ?? this.isSelected
    );
  }
}