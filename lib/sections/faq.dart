import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../i18n/i18n.dart';

class _FaqData {
  const _FaqData({required this.id, required this.questionKey, required this.answerKey});

  final String id;
  final String questionKey;
  final String answerKey;
}

const _faqs = [
  _FaqData(id: 'faq_1', questionKey: 'faq_1_q', answerKey: 'faq_1_a'),
  _FaqData(id: 'faq_2', questionKey: 'faq_2_q', answerKey: 'faq_2_a'),
  _FaqData(id: 'faq_3', questionKey: 'faq_3_q', answerKey: 'faq_3_a'),
];

/// FAQ accordion, with local state tracking which single item is open at a
/// time (matches the original site's behavior of closing others on open).
class Faq extends StatefulComponent {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  String? _openId;

  @override
  Component build(BuildContext context) {
    return section(id: 'faq', classes: 'section faq-section', [
      div(classes: 'container', [
        div(classes: 'section-header text-center', [
          h2(classes: 'section-title', [.text(t(context, 'faq_title'))]),
        ]),
        div(
          classes: 'faq-accordion',
          [
            for (final faq in _faqs)
              div(classes: faq.id == _openId ? 'faq-item glass-card active' : 'faq-item glass-card', [
                button(
                  classes: 'faq-question',
                  onClick: () => setState(() => _openId = _openId == faq.id ? null : faq.id),
                  [
                    span([.text(t(context, faq.questionKey))]),
                    span(classes: 'faq-icon', [.text('+')]),
                  ],
                ),
                div(classes: 'faq-answer', [
                  p([.text(t(context, faq.answerKey))]),
                ]),
              ]),
          ],
        ),
      ]),
    ]);
  }
}
