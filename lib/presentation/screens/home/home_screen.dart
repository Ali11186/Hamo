import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categoryImages = <String, String>{
    'اتصالات': 'assets/images/category_etisalat.jpg',
    'فودافون': 'assets/images/category_vodafone.jpg',
    'فواتير': 'assets/images/category_bills.jpg',
  };

  void _openCategory(BuildContext context, String category) {
    context.push('/category/${Uri.encodeComponent(category)}', extra: category);
  }

  @override
  Widget build(BuildContext context) {
    final categories = AppConstants.productCategories;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'اختر القسم',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final image = _categoryImages[category];
                    return Semantics(
                      button: true,
                      label: category,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(22),
                          onTap: () => _openCategory(context, category),
                          child: Ink(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: Theme.of(context).dividerColor.withOpacity(.35),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.08),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(21),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  if (image != null)
                                    Image.asset(image, fit: BoxFit.cover)
                                  else
                                    const ColoredBox(color: Colors.blueGrey),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 54,
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.black.withOpacity(.0),
                                            Colors.black.withOpacity(.78),
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        category,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.w800,
                                          shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
