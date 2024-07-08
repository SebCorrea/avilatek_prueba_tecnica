import 'package:avilatek_prueba_tecnica/config/theme/ui_extension.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../core/ui/widgets/fade_in_animation.dart';
import '../../domain/entities/actor.dart';

class ActorItem extends StatelessWidget {
  final Actor actor;
  final void Function(Actor actor) onClickActor;

  const ActorItem({
    super.key,
    required this.actor,
    required this.onClickActor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClickActor(actor),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _ActorImage(actor: actor),
            const _BackgroundGradient(),
            _ActorInfo(
              actor: actor,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActorImage extends StatelessWidget {
  final Actor actor;

  const _ActorImage({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      actor.profilePath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          fit: BoxFit.cover,
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const SizedBox();
        }
        return FadeInAnimation(child: child);
      },
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColors.black950, Colors.transparent],
          stops: [0, 0.4],
        ),
      ),
    );
  }
}

class _ActorInfo extends StatelessWidget {
  final Actor actor;

  const _ActorInfo({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium!.copyWith(color: AppColors.white50),
          ),
          Text(
            actor.character,
            style: context.textTheme.bodySmall!.copyWith(color: AppColors.white200),
          ),
        ],
      ),
    );
  }
}
