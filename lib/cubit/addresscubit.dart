// AddressData class
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressData {
  final String fullName;
  final String phoneNumber;
  final String address;
  final String locality;
  final String city;
  final String? selectedState;
  final String? selectedCountry;
  final String? selectedOption;
  final bool isDefault;

  AddressData({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.locality,
    required this.city,
    this.selectedState,
    this.selectedCountry,
    this.selectedOption,
    this.isDefault = false,
  });

  AddressData copyWith({
    String? fullName,
    String? phoneNumber,
    String? address,
    String? locality,
    String? city,
    String? selectedState,
    String? selectedCountry,
    String? selectedOption,
    bool? isDefault,
  }) {
    return AddressData(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      locality: locality ?? this.locality,
      city: city ?? this.city,
      selectedState: selectedState ?? this.selectedState,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedOption: selectedOption ?? this.selectedOption,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}

// Cubit
class ManageAddressCubit extends Cubit<List<AddressData>> {
  ManageAddressCubit() : super([]);

  void addAddress(AddressData addressData) {
    final updatedAddresses = List<AddressData>.from(state)..add(addressData);
    emit(updatedAddresses);
  }

  void updateAddress(int index, String updatedAddress) {
    if (index >= 0 && index < state.length) {
      final updatedAddresses = List<AddressData>.from(state);
      final AddressData updatedData =
          state[index].copyWith(address: updatedAddress);
      updatedAddresses[index] = updatedData;
      emit(updatedAddresses);
    }
  }

  void removeAddress(int index) {
    if (index >= 0 && index < state.length) {
      final updatedAddresses = List<AddressData>.from(state)..removeAt(index);
      emit(updatedAddresses);
    }
  }

  void updateAddressDetails({
    String? selectedState,
    String? selectedCountry,
    String? selectedOption,
    required String fullName,
    required String phoneNumber,
    required String address,
    required String locality,
    required String city,
  }) {
    // Assuming you have an existing AddressData to update
    final existingData = state.isNotEmpty
        ? state.first
        : AddressData(
            fullName: '',
            phoneNumber: '',
            address: '',
            locality: '',
            city: '',
          );

    final updatedData = existingData.copyWith(
      fullName: fullName,
      phoneNumber: phoneNumber,
      address: address,
      locality: locality,
      city: city,
      selectedState: selectedState,
      selectedCountry: selectedCountry,
      selectedOption: selectedOption,
    );

    emit([updatedData]);
  }

  void setAsDefault(int index) {
    if (index >= 0 && index < state.length) {
      final updatedAddresses = List<AddressData>.from(state);
      for (int i = 0; i < updatedAddresses.length; i++) {
        updatedAddresses[i] =
            updatedAddresses[i].copyWith(isDefault: i == index);
      }
      emit(updatedAddresses);
    }
  }
}
